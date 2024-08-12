$:.unshift File.dirname(__FILE__)

# stdlib
require 'yaml'
require 'cgi'
require 'securerandom'

# 3rd Party
require 'json'
require 'nokogiri'
require 'rest-client'

# Internal
require 'omniship/version'
require 'omniship/base'
require 'omniship/errors'
require 'omniship/ups'
require 'omniship/upsmi'
require 'omniship/landmark'
require 'omniship/usps'
require 'omniship/dhlgm'
require 'omniship/dhl'
require 'omniship/fedex'
require 'omniship/newgistics'
require 'omniship/pitney_bowes'


module Omniship
  PROVIDERS = [UPSMI, UPS, Landmark, FedEx, DHLGM, DHL, USPS, Newgistics, PitneyBowes]
  class << self
    attr_accessor :debug, :track_timeout
  end

  # Load configuration information from a YAML file.
  #
  # file - The String filename of the YAML config file.
  #
  # Returns nothing.
  def self.config(file)
    data = YAML.load(ERB.new(File.read(file)).result)

    if omniship = data['Omniship']
      Omniship.debug = omniship['debug']
      Omniship.track_timeout = omniship['track_timeout'] || 10 # 10 seconds default

      if usps = omniship['USPS']
        USPS.userid = usps['userid']
        USPS.password = usps['password']
        USPS.client_ip = usps['client_ip']
        USPS.source_id = usps['source_id']
        USPS.test = usps['test']

        if retailer = usps['retailer']
          USPS.retailer_name = retailer['name']
          USPS.retailer_address = retailer['address']
        end
        if permit = usps['permit']
          USPS.permit_number = permit['number']
          USPS.permit_city = permit['city']
          USPS.permit_state = permit['state']
          USPS.permit_zip5 = permit['zip5']
        end
        if pdu = usps['pdu']
          USPS.pdu_po_box = pdu['po_box']
          USPS.pdu_city = pdu['city']
          USPS.pdu_state = pdu['state']
          USPS.pdu_zip5 = pdu['zip5']
        end
      end

      if ups = omniship['UPS']
        UPS.username = ups['username']
        UPS.password = ups['password']
        UPS.token = ups['token']
        UPS.client_id = ups['client_id']
        UPS.client_secret = ups['client_secret']
        UPS.test = ups['test']
        UPS.source = ups['source']
      end

      if landmark = omniship['Landmark']
        Landmark.username = landmark['username']
        Landmark.password = landmark['password']
        Landmark.client_id = landmark['client_id']
        Landmark.test_mode = landmark['test_mode']
      end

      if dhlgm = omniship['DHLGM']
        DHLGM.username = dhlgm['username']
        DHLGM.password = dhlgm['password']
        DHLGM.mailer_id = dhlgm['mailer_id'].to_s # this could be implied an integer by the yaml parser
      end

      if newgistics = omniship['Newgistics']
        Newgistics.merchant_id = newgistics['merchant_id']
        Newgistics.api_key = newgistics['api_key']
        Newgistics.test = newgistics['test'].to_s
      end

      if pitney_bowes = omniship['PitneyBowes']
        PitneyBowes.api_key = pitney_bowes['api_key']
        PitneyBowes.api_secret = pitney_bowes['api_secret']
        PitneyBowes.test = pitney_bowes['test']
      end

      if fedex = omniship['FedEx']
        FedEx.api_key = fedex['api_key']
        FedEx.api_secret = fedex['api_secret']
        FedEx.test = fedex['test']
      end
    end
    nil
  end

  # Track a package based on a tracking number
  # supports Landmark Global, UPS, DHL Global Mail, USPS
  def self.track(number)
    provider = self.provider_from_number(number)
    if provider
      if provider.respond_to?(:track)
        provider.send(:track, number)
      else
        raise TrackError.new("#{provider.const_get(:LABEL)} does not support tracking.")
      end
    else
      raise ProviderError.new("No provider found for #{number}")

    end
  end

  def self.shipper_label(number)
    provider = self.provider_from_number(number)
    if provider
      provider.const_get(:LABEL)
    else
      raise ProviderError.new("No provider found for #{number}")
    end
  end

  def self.tracking_url(number)
    provider = self.provider_from_number(number)
    if provider
      provider.send(:tracking_url, number)
    else
      raise ProviderError.new("No provider found for #{number}")
    end
  end

  private

  def self.provider_from_number(number)
    PROVIDERS.detect do |provider|
      provider.send(:tracking_test?, number)
    end
  end
end

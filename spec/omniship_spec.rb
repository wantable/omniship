require 'spec_helper'

describe "Omniship" do

  it 'parsing config file and changing configs dynamically' do
    env_dup = ENV.to_h.dup
    ups_username = 'ups_username'
    ENV['UPS_USERNAME'] = ups_username
    usps_userid = 'usps_userid'
    ENV['USPS_USERID'] = usps_userid
    usps_returns_permit_number = '1234'
    ENV['USPS_RETURNS_PERMIT_NUMBER'] = usps_returns_permit_number
    landmark_username = 'landmark_username'
    ENV['LANDMARK_USERNAME'] = landmark_username
    dhlgm_username = 'dhlgm_username'
    ENV['DHLGM_USERNAME'] = dhlgm_username

    Omniship.config("spec/sample_config.yml")
    expect(Omniship::UPS.username).to eq(ups_username)
    expect(Omniship::USPS.userid).to eq(usps_userid)
    expect(Omniship::USPS.permit_number).to eq(usps_returns_permit_number)
    expect(Omniship::Landmark.username).to eq(landmark_username)
    expect(Omniship::DHLGM.username).to eq(dhlgm_username)
    expect(Omniship::track_timeout).to eq(5)
    expect(Omniship::debug).to eq(false)

    Omniship::track_timeout = 50
    expect(Omniship::track_timeout).to eq(50)

    # revert to system env
    env_dup.each do |key, value|
      ENV[key] = value unless value == ENV[key]
    end
  end

  it 'shipper label' do    
    LANDMARK_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::Landmark::LABEL), tracking
    end

    UPS_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::UPS::LABEL), tracking
    end

    DHLGM_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::DHLGM::LABEL), tracking
    end

    USPS_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::USPS::LABEL), tracking
    end

    UPSMI_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::UPSMI::LABEL), tracking
    end

    DHL_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::DHL::LABEL), tracking
    end

    FED_EX_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::FedEx::LABEL), tracking
    end

    NEWGISTICS_VALID_BARCODES.each do |barcode|
      expect(Omniship.shipper_label(barcode)).to eq(Omniship::Newgistics::LABEL), barcode
    end

    not_a_number = "NOT A NUMBER"
    expect { Omniship.shipper_label(not_a_number) }.to raise_error(Omniship::ProviderError)
  end

  it 'track' do    
    # TODO: I no longer have valid test api credentials
    # LANDMARK_VALID_NUMBERS.each do |tracking|
    #   expect(Omniship.track(tracking).class).to eq(Omniship::Landmark::Track::Response), tracking
    # end

    expect(Omniship.track(UPS_VALID_TEST_NUMBER_DELIVERED).class).to eq(Omniship::UPS::Track::Response)

    DHLGM_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::DHLGM::Track::Error)
    end

    USPS_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::USPS::Track::Error)
    end

    UPSMI_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::UPS::Track::Error)
    end

    DHL_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::TrackError)
    end

    FED_EX_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::TrackError)
    end

    not_a_number = "NOT A NUMBER"
    expect { Omniship.track(not_a_number) }.to raise_error(Omniship::ProviderError)
  end

  it 'tracking url' do    
    LANDMARK_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::Landmark::TRACKING_URL), tracking
    end

    UPS_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::UPS::TRACKING_URL), tracking
    end

    DHLGM_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::DHLGM::TRACKING_URL), tracking
    end

     USPS_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::USPS::TRACKING_URL), tracking
    end

    UPSMI_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::UPS::TRACKING_URL), tracking
    end

    DHL_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::DHL::TRACKING_URL), tracking
    end

    FED_EX_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::FedEx::TRACKING_URL), tracking
    end

    not_a_number = "NOT A NUMBER"
    expect { Omniship.tracking_url(not_a_number) }.to raise_error(Omniship::ProviderError)
  end
end

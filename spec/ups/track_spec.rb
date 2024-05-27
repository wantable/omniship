require 'spec_helper'

describe "UPS::Track" do
  # TODO - switch all these tests to webmock and we're good
  it 'invalid tracking' do
    skip "can't run on travis" if ENV["TRAVIS"]
    expect { Omniship::UPS.track(UPS_INVALID_TEST_NUMBER) }.to raise_error(Omniship::UPS::Track::Error)
  end

  it 'arrived shipment' do
    skip "can't run on travis" if ENV["TRAVIS"]
    trk = Omniship::UPS.track(UPS_VALID_TEST_NUMBER_DELIVERED)
    expect(trk.has_arrived?).to be true
  end

  it 'left shipment' do
    skip "can't run on travis" if ENV["TRAVIS"]
    trk = Omniship::UPS.track(UPS_VALID_TEST_NUMBER_ORIGIN_SCAN)
    expect(trk.has_arrived?).to be false
    expect(trk.has_left?).to be true
  end

  it 'mocked left shipment' do
    trk = Omniship::UPS::Track::Response.new(track_ups_left_not_arrived)

    expect(trk.has_arrived?).to be false
    expect(trk.has_left?).to be true
  end

  it 'timstamp parsing' do
    expect(Omniship::UPS.parse_timestamp("20170117", "211600")).to eq(Time.parse("2017-01-17 21:16"))
  end

  it 'test json parsing' do
    trk = Omniship::UPS::Track::Response.new(track_ups_response)
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq false
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to be_nil
    activity = package.activity.first
    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.timestamp).to_not be_nil
  end

  it 'text json parsing of mail innovations' do
    trk = Omniship::UPS::Track::Response.new(track_ups_mi_response)
    expect(trk.has_left?).to eq false
    expect(trk.has_arrived?).to eq false
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil

    alternate_tracking = package.alternate_tracking
    expect(alternate_tracking).to_not be_nil
    expect(alternate_tracking.type).to eq(Omniship::UPS::Track::AlternateTracking::POSTAL_SERVICE_TRACKING_ID)
    expect(alternate_tracking.value).to_not be_nil
  end
  it 'test json parsing of surepost' do
    trk = Omniship::UPS::Track::Response.new(track_ups_surepost_response)
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq false # will never get to true because this package doesn't know the result of the alternate_tracking package
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil

    alternate_tracking = package.alternate_tracking
    expect(alternate_tracking).to_not be_nil
    expect(alternate_tracking.type).to eq(Omniship::UPS::Track::AlternateTracking::POSTAL_SERVICE_TRACKING_ID) # we fake this
    expect(alternate_tracking.value).to_not be_nil
  end

  it 'test parsing not found' do
    error = Omniship::UPS::Track::Error.new(404, track_ups_not_found_response.dig('trackResponse', 'shipment').first['warnings'])
    expect(error.code).to eq(Omniship::TrackError::NOT_FOUND)
  end
end

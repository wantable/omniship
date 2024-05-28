require 'spec_helper'

describe "UPSMI::Track" do
  it 'invalid tracking' do
    expect { Omniship::UPSMI.track(UPSMI_TEST_NUMBER)  }.to_not raise_error(Omniship::TrackError)
    expect { Omniship::UPSMI.track(UPS_INVALID_TEST_NUMBER)  }.to raise_error(Omniship::TrackError)
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

  it 'test json parsing not found' do
    error = Omniship::UPS::Track::Error.new(404, track_ups_mi_not_found_response.dig('trackResponse', 'shipment').first['warnings'])
    expect(error.code).to eq(Omniship::TrackError::NOT_FOUND)
  end

end


require 'spec_helper'

describe "USPS::Track" do
  it 'raises error without bearer token' do
    expect { Omniship::USPS.track('9261290289104185136058', bearer_token: nil) }.to raise_error(RuntimeError)
  end

  it 'timstamp parsing' do 
    expect(Omniship::USPS.parse_timestamp("January 17, 2017", "7:09 am")).to eq(Time.parse("2017-01-17 07:09"))
  end

  it 'test arrived tracking parsing' do
    trk = Omniship::USPS::Track::Response.new(track_usps_arrived_response)
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true
    package = trk.shipment.packages.first

    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to_not be_nil

    activity = package.activity.first

    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.address.to_s).to eq("MILWAUKEE, WI 53207")
    expect(activity.timestamp).to_not be_nil
  end

  it 'test in progress tracking parsing' do
    trk = Omniship::USPS::Track::Response.new(track_usps_in_progress_response)
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq false
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to_not be_nil

    activity = package.activity.find {|a| !a.address.state.nil? }

    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.address.to_s).to eq("NEW BERLIN, WI 53151")
    expect(activity.timestamp).to_not be_nil
  end

  it 'test json parsing not found' do
    error = Omniship::USPS::Track::Error.new(track_usps_not_found_response)
    expect(error.code).to eq('400')
  end
end

require 'spec_helper'

describe "USPS::Track" do
  it 'raises error without bearer token' do
    expect { Omniship::USPS.track('9261290289104185136058', access_token: nil) }.to raise_error(RuntimeError)
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

    expect(package.delivered_at).to eq(Time.parse("2024-11-23T13:10:00"))
    expect(trk.shipment.delivered_at).to eq(Time.parse("2024-11-23T13:10:00"))

    # USPS v3 tracking carries no recipient name in this sample, so no POD
    expect(package.proof_of_delivery).to be_nil

    activity = package.activity.first

    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.address.to_s).to eq("MILWAUKEE, WI 53207")
    expect(activity.timestamp).to_not be_nil
  end

  it 'exposes proof of delivery when USPS populates the recipient' do
    trk = Omniship::USPS::Track::Response.new(track_usps_arrived_response)
    package = trk.shipment.packages.first

    delivered_event = package.activity.find { |a| a.code == '01' }
    delivered_event.root['name'] = 'J SMITH'

    pod = package.proof_of_delivery
    expect(pod).to_not be_nil
    expect(pod.received_by).to eq('J SMITH')
    expect(pod.signed_by).to eq('J SMITH')
    expect(trk.shipment.proof_of_delivery).to_not be_nil
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

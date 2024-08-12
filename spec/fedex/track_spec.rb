require 'spec_helper'

describe "FedEx::Track" do
  it 'test json parsing' do
    resp = JSON.parse(track_fedex_response).dig('output', 'completeTrackResults')

    trk = Omniship::FedEx::Track::Response.new(resp)

    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true

    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil

    expect(trk.shipment.scheduled_delivery).to_not be_nil

    activity = package.activity.first

    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.timestamp).to_not be_nil
  end
end

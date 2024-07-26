require 'spec_helper'

describe "PitneyBowes::Track" do
  it 'test json parsing' do
    trk = Omniship::PitneyBowes::Track::Response.new(track_pitney_bowes_response)
    expect(trk.has_left?).to eq false
    expect(trk.has_arrived?).to eq false
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to be_nil
    activity = package.activity.first
    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.timestamp).to_not be_nil
  end
end

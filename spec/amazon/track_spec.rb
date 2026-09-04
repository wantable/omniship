require 'spec_helper'

describe "Amazon::Track" do
  it 'matches tracking prefixes' do
    expect(Omniship::Amazon::tracking_test?('TBA123456789012')).to(eq(true))
    expect(Omniship::Amazon::tracking_test?('TBM123456789012')).to(eq(true))
    expect(Omniship::Amazon::tracking_test?('TBC123456789012')).to(eq(true))
    expect(Omniship::Amazon::tracking_test?('123456789012')).to(eq(false))
  end

  it 'raises error without bearer token' do
    expect { Omniship::Amazon.track('9261290289104185136058', access_token: nil) }.to raise_error(RuntimeError)
  end

  it 'test arrived tracking parsing' do
    payload = JSON.parse(json_track_arrived_amazon_response)['payload']
    trk = Omniship::Amazon::Track::Response.new(payload)
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true
    package = trk.shipment.packages.first

    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to_not be_nil

    expect(package.delivered_at).to eq(Time.parse("2019-03-21T14:29:51Z"))
    expect(trk.shipment.delivered_at).to eq(Time.parse("2019-03-21T14:29:51Z"))

    pod = package.proof_of_delivery
    expect(pod).to_not be_nil
    expect(pod.delivery_image_url).to eq("https://s3.amazonaws.com/amzn-pod/delivery-image.jpg")
    expect(pod.signature_image_url).to eq("https://s3.amazonaws.com/amzn-pod/signature-image.jpg")
    expect(pod.received_by).to eq("John Doe")
    expect(package.delivery_image_url).to eq("https://s3.amazonaws.com/amzn-pod/delivery-image.jpg")
    expect(trk.shipment.proof_of_delivery).to_not be_nil

    activity = package.activity.find { |a| !a.address.state.nil? }

    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.address.to_s).to eq("Bethpage, NY 11714 US")
    expect(activity.timestamp).to_not be_nil
  end

  it 'test in progress tracking parsing' do
    payload = JSON.parse(json_track_shipped_amazon_response)['payload']
    trk = Omniship::Amazon::Track::Response.new(payload)
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq false
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to_not be_nil

    expect(package.delivered_at).to be_nil
    expect(package.proof_of_delivery).to be_nil
    expect(package.delivery_image_url).to be_nil

    activity = package.activity.find { |a| !a.address.state.nil? }

    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.address.to_s).to eq("Bethpage, NY 11714 US")
    expect(activity.timestamp).to_not be_nil
  end
end

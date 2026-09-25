require 'spec_helper'

describe "FedEx::Track" do
  it 'test json parsing' do
    resp = JSON.parse(track_fedex_response).dig('output', 'completeTrackResults')

    trk = Omniship::FedEx::Track::Response.new(resp)

    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true

    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery.to_date).to_not be_nil
    expect(trk.shipment.scheduled_delivery.to_date).to eq Date.parse('2024-08-14')

    expect(package.delivered_at).to_not be_nil
    expect(package.delivered_at).to eq(Time.parse("2024-08-12T15:18:10 -0500"))
    expect(trk.shipment.delivered_at).to eq(Time.parse("2024-08-12T15:18:10 -0500"))

    pod = package.proof_of_delivery
    expect(pod).to_not be_nil
    expect(pod.received_by).to eq 'Reciever'
    expect(pod.signed_by).to eq 'Reciever'
    expect(pod.location_description).to eq 'Receptionist/Front Desk'
    expect(trk.shipment.proof_of_delivery).to_not be_nil

    activity = package.activity.first

    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.timestamp).to_not be_nil
  end

  it 'test json parsing estimated delivery without a time window' do
    resp = JSON.parse(track_fedex_response).dig('output', 'completeTrackResults')
    resp.first['trackResults'].first['estimatedDeliveryTimeWindow'] = nil
    trk = Omniship::FedEx::Track::Response.new(resp)

    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true

    package = trk.shipment.packages.first
    expect(trk.shipment.scheduled_delivery.to_date).to_not be_nil
    expect(trk.shipment.scheduled_delivery.to_date).to eq Date.parse('2007-09-27')
  end

  it 'test json parsing raising error' do
    errors = Omniship::FedEx::Track::Request.send(:find_track_errors, track_fedex_not_found_response.dig('output', 'completeTrackResults'))

    expect(errors).to_not be_empty
  end

  it 'test json parsing raising error if nil' do
    errors = Omniship::FedEx::Track::Request.send(:find_track_errors, nil)

    expect(errors).to_not be_empty
  end

  it "parse timestamp works even if the datetime doesn't have offset" do
    [
      '2026-09-25T00:00:00',
      '2026-09-24T15:22:00-04:00',
      '2026-09-24T11:19:05-05:00',
      '2026-09-23T18:59:11-04:00',
      '2026-09-23T06:58:35-04:00',
      '2026-09-21T18:48:00-04:00',
      '2026-09-21T12:46:21-04:00',
      '2026-09-20T23:18:37-04:00',
      '2026-09-19T23:01:12-04:00',
      '2026-09-19T04:39:29-05:00',
      '2026-09-18T18:19:00-05:00',
      '2026-09-17T12:47:15-05:00'
    ].each do |datetime|
      expect {
        Omniship::FedEx.parse_timestamp(datetime, offset: true)
      }.not_to(raise_error(ArgumentError))
    end
  end
end

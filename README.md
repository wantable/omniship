Omniship
========

[![Build Status](https://travis-ci.org/wantable/omniship.svg?branch=master)](https://travis-ci.org/wantable/omniship)

Currently Supported Functionality
---------------------------------

* [Tracking Url](#tracking-url)
  * auto detects the provider based on the format of the tracking number
  * works with UPS, USPS, DHL Global Mail (if Omniship::DHLGM.mailer_id is set and matches), FedEx, Landmark Global, UPS Mail Innovations, Newgistics (barcode only)

* [Track](#track)
  * auto detects the provider based on the format of the tracking number
  * works with UPS, USPS, DHL Global Mail (if Omniship::DHLGM.mailer_id is set and matches), FedEx, Landmark Global, UPS Mail Innovations , Newgistics (barcode only)

* [UPS and UPS Mail Innovations](#ups-and-ups-mail-innovations)
  * Track

* [Landmark Global](#landmark-global)
  * Landmark
    * Track
    * Track with reference

* [USPS](#usps)
  * Track

* [DHL Global Mail](#dhl-global-mail)
    * Track

* [Newgistics](#newgistics)
    * Track

Configuration

Add to your gemfile

```ruby
gem 'omniship', git: 'git://github.com/wantable/omniship.git'
```

Set authentication details; you only need the details for services you'll be using; tracking url stuff doesn't need any authentications

```ruby
Omniship::UPS.username = 'johndoe'
Omniship::UPS.password = '1234567890'
Omniship::UPS.token = 'QWERTYUIOP'

Omniship::USPS.userid = 'johndoe'
Omniship::USPS.password = '1234567890'

Omniship::Landmark.username = 'johndoe'
Omniship::Landmark.password = '1234567890'
Omniship::Landmark.client_id = '123'
Omniship::Landmark.test_mode = true # this turns Landmark's test mode on

Omniship::DHLGM.username = 'johndoe'
Omniship::DHLGM.password = '1234567890'
Omniship::DHLGM.mailer_id = '1234567890' # this is required to detect the shipper type, since USPS and DHL are otherwise indistinguisiblle

Omniship::PitneyBowes.api_key = 'XXXX'
Omniship::PitneyBowes.api_secret = 'YYYY'
Omniship::PitneyBowes.test = true/false

Omniship.debug = true # with this enabled all xml request's and responses will be outputed to the log

Omniship.track_timeout = 5 # timeout for a tracking request in seconds. Only implemented on UPS, USPS, DHLGM. Default = 10 seconds
```

You can also do this in a config file
config/settings.yaml

```yml
Omniship:
  debug: true

  USPS:
    userid: johndoe
    password: 1234567890
    client_ip: 127.0.0.1
    source_id: Wantable, Inc.

    retailer:
      name: Wantable
      address: 223 N Water St. STE 300
    permit:
      number: 1234
      city: Milwaukee
      state: WI
      zip5: 53202
    pdu:
      po_box: 223 N Water ST STE 300
      city: Milwaukee
      state: WI
      zip5: 53202

  UPS:
    username: johndoe
    password: 1234567890

  Landmark:
    username: johndoe
    password: 1234567890
    client_id: 123
    debug: true


  DHLGM:
    username: johndoe
    password: 1234567890

  PitneyBowes:
    api_key: YYYY
    api_secret: XXXX
    test: false
```


and then set it up in an intializer like:

```ruby
Omniship.config('config/settings.yml')
```


UPS and UPS Mail Innovations
---

Track

```ruby
trk = Omniship::UPS.track('1z3050790327433970')
```

or if its a mail innovations package

```ruby
trk = Omniship::UPS.track('123456790', true)
trk.class
# => Omniship::UPS::Track::Response

trk.shipment.class
# => Omniship::UPS::Track::Shipment

trk.shipment.scheduled_delivery
# => Mon Nov 29 12:00:00 UTC 2010

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false

trk.shipment.packages.first.tracking_number
# => "123456790"
```

USPS
---

Track

```ruby
trk = Omniship::USPS.track('9400111201080302430600')
trk.class
# => Omniship::USPS::Track::Response

trk.shipment.class
# => Omniship::USPS::Track::Shipment

trk.shipment.scheduled_delivery
# => Mon Nov 29 12:00:00 UTC 2010

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false

trk.shipment.packages.first.tracking_number
# => "9400111201080302430600"
```


Landmark Global
---------------

Track
```ruby
trk = Omniship::Landmark.track('LTN64365934N1')
```

Track with reference

```ruby
trk = Omniship::Landmark.track_with_reference('REFID')
trk.class
# => Omniship::Landmark::Track::Response

trk.shipment.class
# => Omniship::Landmark::Track::Shipment

trk.shipment.scheduled_delivery
# => Mon Nov 29 12:00:00 UTC 2010

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false

trk.shipment.packages.first.tracking_number
# => "LTN62075201N1"
```

DHL Global Mail
---------------

Track

```ruby
trk = Omniship::DHLGM.track('12345')
trk.class
# => Omniship::DHLGM::Track::Response

trk.shipment.class
# => Omniship::DHLGM::Track::Shipment

trk.shipment.scheduled_delivery - not supported by DHL Global Mail
# => nil

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false
```

Newgistics
---------------

Track

```ruby
trk = Omniship::Newgistics.track('12345')
trk.class
# => Omniship::Newgistics::Track::Response

trk.shipment.class
# => Omniship::Newgistics::Track::Shipment

trk.shipment.scheduled_delivery - not supported by DHL Global Mail
# => nil

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false
```

PitneyBowes
---------------

Track

```ruby
trk = Omniship::PitneyBowes.track('12345')
trk.class
# => Omniship::PitneyBowes::Track::Response

trk.shipment.class
# => Omniship::PitneyBowes::Track::Shipment

trk.shipment.scheduled_delivery
# => nil / date

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false
```

Track
-----

You can also track it if you don't know what provider it is (currently supports UPS, USPS, Landmark, and DHL Global Mail [only if Omniship::DHLGM.mailer_id configured and matches], Newgistics [using barcode])

```ruby
trk = Omniship.track('LTN64365934N1')
trk.class
# => Omniship::Landmark::Track::Response
```

Tracking Url
------------

Build the url to view tracking information from the tracking number (currently supports UPS, UPS Mail Innovations, USPS, DHL, DHL Global Mail [only if Omniship::DHLGM.mailer_id configured and matches], FedEx, Landmark Global, Newgistics [using barcode])

```
Omniship.tracking_url('1z3050790327433970')
# => "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=1z3050790327433970"
```


TODO
------
- Add rubocop or some code standardization
- Convert tests to use [webmock](https://github.com/bblimke/webmock) or similar strategy instead of calling the api's.
  - Unskip Landmark and Newgistics tests once they are passing with valid credentials. Search for "I no longer have valid test api credentials"
- Fix time zone issue with Newgistics.parse_timestamp
- Add zip to time zone conversion for UPS and USPS timestamps
- Bulk tracking? Newgistics at least supports it.
- Use the `track_timeout` config var in Landmark and Newgistics. At this time I do not have access to those api's to develop this.

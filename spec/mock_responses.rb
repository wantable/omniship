module MockResponses
  # here are some known API responses we can use to test our xml parsing
  def track_dhlgm_response
    "<track>
      <shipment>
        <trackingnumber>1071180100692707</trackingnumber>
        <deliveryconfirm>9261299996349762041684</deliveryconfirm>
        <customerconfirm>S725347170</customerconfirm>
        <address1>1 BRUCKNER BLVD</address1>
        <address2/>
        <city>BRONX</city>
        <state>NY</state>
        <zip>10454</zip>
        <weight>2.928</weight>
        <shipped>1/10/2017</shipped>
        <signedby/>
        <event>
          <code>600</code>
          <date>1/17/2017</date>
          <time>12:26 PM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>DELIVERED</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>598</code>
          <date>1/17/2017</date>
          <time>8:53 AM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>OUT FOR DELIVERY</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>539</code>
          <date>1/17/2017</date>
          <time>8:43 AM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>SORTING COMPLETE</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>520</code>
          <date>1/16/2017</date>
          <time>12:41 PM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>ARRIVAL AT POST OFFICE</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>540</code>
          <date>1/15/2017</date>
          <time>4:05 AM ET</time>
          <city>New York</city>
          <state>NY</state>
          <description>PROCESSED THROUGH SORT FACILITY</description>
          <postalcode>10199</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>526</code>
          <date>1/15/2017</date>
          <time>2:50 AM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>ARRIVED USPS SORT FACILITY</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
          <event>
          <code>400</code>
          <date>1/12/2017</date>
          <time>7:32 AM ET</time>
          <city>Secaucus</city>
          <state>NJ</state>
          <description>TENDERED TO USPS</description>
          <postalcode>07094</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>350</code>
          <date>1/12/2017</date>
          <time>12:59 AM ET</time>
          <city>Secaucus</city>
          <state>NJ</state>
          <description>ARRIVAL DESTINATION DHL DISTRIBUTION CENTER</description>
          <postalcode>07094</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>300</code>
          <date>1/11/2017</date>
          <time>4:49 AM CT</time>
          <city>Melrose Park</city>
          <state>IL</state>
          <description>DEPARTURE DHL DISTRIBUTION CENTER</description>
          <postalcode>60160</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>220</code>
          <date>1/10/2017</date>
          <time>11:23 PM CT</time>
          <city>Melrose Park</city>
          <state>IL</state>
          <description>PROCESSED</description>
          <postalcode>60160</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>200</code>
          <date>1/10/2017</date>
          <time>9:09 PM CT</time>
          <city>Melrose Park</city>
          <state>IL</state>
          <description>ARRIVAL DHL DISTRIBUTION CENTER</description>
          <postalcode>60160</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>132</code>
          <date>1/10/2017</date>
          <time>7:42 PM EST</time>
          <city/>
          <state/>
          <description>EN ROUTE TO DHL ECOMMERCE</description>
          <postalcode/>
          <country/>
        </event>
        <event>
          <code>99</code>
          <date>1/10/2017</date>
          <time>7:34 PM EST</time>
          <city/>
          <state/>
          <description>ELECTRONIC NOTIFICATION RECEIVED: YOUR ORDER HAS BEEN PROCESSED AND TRACKING WILL BE UPDATED SOON</description>
          <postalcode/>
          <country/>
        </event>

      </shipment>

    </track>"
  end

  def track_dhlgm_not_found_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <track>
      <error>
        <code>400</code>
        <description>No results for your tracking number.</description>
      </error>
    </track>"
  end

  def track_landmark_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
       <Result>
        <Success>true</Success>
        <Packages>
         <Package>
          <TrackingNumber>JJD0002250044220462</TrackingNumber>
          <LandmarkTrackingNumber>LTN17080940N1</LandmarkTrackingNumber>
          <PackageReference>EW187536225</PackageReference>
          <Events>
             <Event>
              <Status>Shipment Data Uploaded</Status>
              <DateTime>2014-07-01 19:48:02</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>50</EventCode>
             </Event>
             <Event>
              <Status>Processed</Status>
              <DateTime>2014-07-03 12:09:36</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>75</EventCode>
             </Event>
             <Event>
              <Status>Scanned at Landmark crossdock facility</Status>
              <DateTime>2014-07-07 06:37:27</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>250</EventCode>
             </Event>
             <Event>
              <Status>Transmitted customs information</Status>
              <DateTime>2014-07-07 09:18:45</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>125</EventCode>
             </Event>
             <Event>
              <Status>Crossing border and in transit to carrier hub</Status>
              <DateTime>2014-07-07 09:30:42</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>150</EventCode>
             </Event>
             <Event>
              <Status>Received in destination country</Status>
              <DateTime>2014-07-09 07:53:47</DateTime>
              <Location>Heston, MIDDX</Location>
              <EventCode>155</EventCode>
             </Event>
             <Event>
              <Status>Parcel collected</Status>
              <DateTime>2014-07-09 20:41:00</DateTime>
              <Location>Hayes service centre</Location>
              <EventCode>200</EventCode>
             </Event>
             <Event>
              <Status>Despatched from service centre</Status>
              <DateTime>2014-07-09 21:11:00</DateTime>
              <Location>Hayes service centre</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Parcel received at service centre</Status>
              <DateTime>2014-07-10 17:20:00</DateTime>
              <Location>Hatfield terminal</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Despatched from service centre</Status>
              <DateTime>2014-07-10 17:22:00</DateTime>
              <Location>Hatfield terminal</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Parcel received at service centre</Status>
              <DateTime>2014-07-11 04:17:00</DateTime>
              <Location>Manchester service centre</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Parcel out for delivery</Status>
              <DateTime>2014-07-11 07:05:00</DateTime>
              <Location>Manchester home delivery</Location>
              <EventCode>300</EventCode>
             </Event>
             <Event>
              <Status>Parcel received by local delivery courier</Status>
              <DateTime>2014-07-11 09:38:00</DateTime>
              <Location>Manchester home delivery</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Parcel delivered</Status>
              <DateTime>2014-07-11 16:42:00</DateTime>
              <Location>Manchester home delivery</Location>
              <EventCode>500</EventCode>
             </Event>
          </Events>
         </Package>
        </Packages>
       </Result>
    </TrackResponse>"
  end

  def track_landmark_not_found_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
      <Errors>
        <Error>
          <ErrorCode>Lookup</ErrorCode>
          <ErrorMessage>Could not find shipment with  tracking number # 9402116901279224348471blah in our system.&amp;lt;br&amp;gt;&amp;lt;br&amp;gt;&amp;lt;span style=\"font-weight: normal; font-size: 14px\"&amp;gt;You can track this shipment on the bpost tracking site &amp;lt;ul class='navlist'&amp;gt;&amp;lt;li&amp;gt;&amp;lt;a href='http://www.bpost2.be/bpostinternational/track_trace/find.php?search=s&amp;lng=en&amp;trackcode=9402116901279224348471blah' target='_blank' style='font-size:14px;'&amp;gt;Track with bpost&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;&amp;lt;/ul&amp;gt;&amp;lt;/span&amp;gt;</ErrorMessage>
        </Error>
      </Errors>
      <Result>
        <Success>false</Success>
        <ResultMessage>See Errors element for error details</ResultMessage>
      </Result>
    </TrackResponse>"
  end

  def track_newgistics_response
    {
      "Packages" =>[
        {
         "ActualEstimatedDeliveryDate" =>"null",
         "CarrierCode" =>"NEWG",
         "CarrierCodeDescription" =>"Newgistics, Inc.",
         "CarrierName" =>"United States Postal Service",
         "CarrierService" =>"USPS Return Delivery Unit 5DZ",
         "CarrierServiceCode" =>"null",
         "CarrierServiceCodeDescription" =>"null",
         "ErrorMessage" =>"",
         "EstimatedDeliveryDate" =>"null",
         "EstimatedDeliveryText" =>"null",
         "FinalCarrier" =>"null",
         "MaxEstimatedDeliveryDate" =>"null",
         "MerchantName" =>"null",
         "MinEstimatedDeliveryDate" =>"null",
         "PackageTrackingEvents" =>[
          {
             "CSREventMessage" =>"Package delivered to returns processing facility.",
             "CarrierCode" =>"SDRC",
             "CarrierDescription" =>"Delivered",
             "City" =>"Milwaukee",
             "ConsumerEventMessage" =>"Package delivered to returns processing facility.",
             "CreateDate" =>"\/Date(-62135575200000-0600)\/",
             "Date" =>"\/Date(1469163600000-0500)\/",
             "Description" =>"Delivered",
             "EventCode" =>"DRC",
             "EventDescription" =>"Delivered to Return Center",
             "FacilityID" =>52687,
             "FacilityName" =>"Wantable Returns",
             "PostalCode" =>"53204",
             "State" =>"WI",
             "Time" =>"\/Date(1484870400000-0600)\/",
             "TrackingKey" =>"320908566",
             "UpdateDate" =>"\/Date(-62135575200000-0600)\/"
          },
          {
             "CSREventMessage" =>"Package in-transit to returns processing facility.",
             "CarrierCode" =>"SS",
             "CarrierDescription" =>"In transit",
             "City" =>"Carol Stream",
             "ConsumerEventMessage" =>"Package in-transit to returns processing facility.",
             "CreateDate" =>"\/Date(-62135575200000-0600)\/",
             "Date" =>"\/Date(1469077200000-0500)\/",
             "Description" =>"In transit",
             "EventCode" =>"DNF",
             "EventDescription" =>"Departing Newgistics Facility",
             "FacilityID" =>47662,
             "FacilityName" =>"ORD2",
             "PostalCode" =>"60188",
             "State" =>"IL",
             "Time" =>"\/Date(1484887140000-0600)\/",
             "TrackingKey" =>"320908566",
             "UpdateDate" =>"\/Date(-62135575200000-0600)\/"
          },
          {
             "CSREventMessage" =>"Package scanned by Newgistics.",
             "CarrierCode" =>"IPS",
             "CarrierDescription" =>"Arrived at Shipping Facility",
             "City" =>"Carol Stream",
             "ConsumerEventMessage" =>"Package scanned by Newgistics.",
             "CreateDate" =>"\/Date(-62135575200000-0600)\/",
             "Date" =>"\/Date(1468904400000-0500)\/",
             "Description" =>"Arrived at Shipping Facility",
             "EventCode" =>"IPS",
             "EventDescription" =>"Inducted into Newgistics Network",
             "FacilityID" =>47662,
             "FacilityName" =>"ORD2",
             "PostalCode" =>"60188",
             "State" =>"IL",
             "Time" =>"\/Date(1484882280000-0600)\/",
             "TrackingKey" =>"320908566",
             "UpdateDate" =>"\/Date(-62135575200000-0600)\/"
          },
          {
             "CSREventMessage" =>"Received by the USPS",
             "CarrierCode" =>"PTS03",
             "CarrierDescription" =>"Arrival at USPS",
             "City" =>"MILWAUKEE",
             "ConsumerEventMessage" =>"Received by the USPS",
             "CreateDate" =>"\/Date(-62135575200000-0600)\/",
             "Date" =>"\/Date(1468904400000-0500)\/",
             "Description" =>"Arrival at USPS",
             "EventCode" =>"PUU",
             "EventDescription" =>"Picked up by USPS",
             "FacilityID" =>14512,
             "FacilityName" =>"WEST MILWAUKEE",
             "PostalCode" =>"532195012",
             "State" =>"WI",
             "Time" =>"\/Date(1484829060000-0600)\/",
             "TrackingKey" =>"320908566",
             "UpdateDate" =>"\/Date(-62135575200000-0600)\/"
          }
         ],
         "ReferenceNumber" =>"000511171",
         "Service" =>"RETURN",
         "ShipToAddressLine1" =>"112 E Mineral Street",
         "ShipToAddressLine2" =>"",
         "ShipToCity" =>"Milwaukee",
         "ShipToName" =>"Wantable Returns",
         "ShipToPostalCode" =>"53204",
         "ShipToState" =>"WI",
         "Signer" =>"null",
         "Status" =>"Delivered",
         "TrackingNumber" =>"7250053219012360010005111713",
         "UnitOfMeasure" =>"pounds",
         "Weight" =>3.5260
        }
       ]
    }
  end

  def track_newgistics_not_found_response
    {
       "Packages" =>[
          {
             "ActualEstimatedDeliveryDate" =>"null",
             "CarrierCode" =>"null",
             "CarrierCodeDescription" =>"null",
             "CarrierName" =>"",
             "CarrierService" =>"",
             "CarrierServiceCode" =>"null",
             "CarrierServiceCodeDescription" =>"null",
             "ErrorMessage" =>"No tracking data available for 9402116901279224348471blah.",
             "EstimatedDeliveryDate" =>"null",
             "EstimatedDeliveryText" =>"null",
             "FinalCarrier" =>"null",
             "MaxEstimatedDeliveryDate" =>"null",
             "MerchantName" =>"null",
             "MinEstimatedDeliveryDate" =>"null",
             "PackageTrackingEvents" =>"null",
             "ReferenceNumber" =>"null",
             "Service" =>"UNKNOWN",
             "ShipToAddressLine1" =>"null",
             "ShipToAddressLine2" =>"null",
             "ShipToCity" =>"null",
             "ShipToName" =>"null",
             "ShipToPostalCode" =>"null",
             "ShipToState" =>"null",
             "Signer" =>"null",
             "Status" =>"NotFound",
             "TrackingNumber" =>"9402116901279224348471blah",
             "UnitOfMeasure" =>"null",
             "Weight" =>"null"
          }
       ]
    }
  end

  def track_usps_arrived_response
    JSON.parse(
      <<~JSON
      {
        "destinationCity": "MILWAUKEE",
        "destinationState": "WI",
        "destinationZIP": "53207",
        "emailEnabled": "true",
        "kahalaIndicator": "false",
        "mailClass": "Parcel Select",
        "mailType": "DM",
        "originCity": "OAK CREEK",
        "originState": "WI",
        "originZIP": "53154",
        "proofOfDeliveryEnabled": "false",
        "restoreEnabled": "false",
        "RRAMEnabled": "false",
        "RREEnabled": "false",
        "services": [
          "USPS Tracking<SUP>&#174;</SUP>"
        ],
        "serviceTypeCode": "612",
        "status": "Delivered, In/At Mailbox",
        "statusCategory": "Delivered",
        "statusSummary": "Your item was delivered in or at the mailbox at 1:10 pm on November 23, 2024 in MILWAUKEE, WI 53207.",
        "tableCode": "T",
        "uniqueMailPieceID": "301474508",
        "mailPieceIntakeDate": "2024-11-19 08:35:56.000000",
        "trackingEvents": [
          {
            "eventType": "Delivered, In/At Mailbox",
            "eventTimestamp": "2024-11-23T13:10:00",
            "GMTTimestamp": "2024-11-23T19:10:09Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "MILWAUKEE",
            "eventState": "WI",
            "eventZIP": "53207",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "01",
            "additionalProp": null
          },
          {
            "eventType": "Out for Delivery",
            "eventTimestamp": "2024-11-23T08:28:00",
            "GMTTimestamp": "2024-11-23T14:28:23Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "MILWAUKEE",
            "eventState": "WI",
            "eventZIP": "53207",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "OF",
            "additionalProp": null
          },
          {
            "eventType": "Arrived at Post Office",
            "eventTimestamp": "2024-11-23T08:17:00",
            "GMTTimestamp": "2024-11-23T14:17:23Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "MILWAUKEE",
            "eventState": "WI",
            "eventZIP": "53207",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "07",
            "additionalProp": null
          },
          {
            "eventType": "Arrived at USPS Facility",
            "eventTimestamp": "2024-11-23T06:22:00",
            "GMTTimestamp": "2024-11-23T12:22:41Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "MILWAUKEE",
            "eventState": "WI",
            "eventZIP": "53207",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "A1",
            "additionalProp": null
          },
          {
            "eventType": "Departed USPS Facility",
            "eventTimestamp": "2024-11-23T06:07:00",
            "GMTTimestamp": "2024-11-23T12:07:39Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "MILWAUKEE",
            "eventState": "WI",
            "eventZIP": "53203",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "T1",
            "additionalProp": null
          },
          {
            "eventType": "Arrived at USPS Facility",
            "eventTimestamp": "2024-11-23T04:35:00",
            "GMTTimestamp": "2024-11-23T10:35:49Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "MILWAUKEE",
            "eventState": "WI",
            "eventZIP": "53203",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "A1",
            "additionalProp": null
          },
          {
            "eventType": "Departed USPS Regional Facility",
            "eventTimestamp": "2024-11-23T04:10:00",
            "GMTTimestamp": "2024-11-23T10:10:53Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "OAK CREEK WI DISTRIBUTION CENTER",
            "eventState": null,
            "eventZIP": null,
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "T1",
            "additionalProp": null
          },
          {
            "eventType": "Arrived at USPS Facility",
            "eventTimestamp": "2024-11-23T03:41:00",
            "GMTTimestamp": "2024-11-23T09:41:38Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "MILWAUKEE",
            "eventState": "WI",
            "eventZIP": "53207",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "A1",
            "additionalProp": null
          },
          {
            "eventType": "Accepted at USPS Regional Destination Facility",
            "eventTimestamp": "2024-11-22T17:22:00",
            "GMTTimestamp": "2024-11-22T23:22:15Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "OAK CREEK WI DISTRIBUTION CENTER",
            "eventState": null,
            "eventZIP": null,
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "AD",
            "additionalProp": null
          },
          {
            "eventType": "Arrived at USPS Regional Facility",
            "eventTimestamp": "2024-11-22T16:20:00",
            "GMTTimestamp": "2024-11-22T22:20:34Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "OAK CREEK WI DISTRIBUTION CENTER",
            "eventState": null,
            "eventZIP": null,
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "A1",
            "additionalProp": null
          },
          {
            "eventType": "Departed Shipping Partner Facility, USPS Awaiting Item",
            "eventTimestamp": "2024-11-22T07:43:00",
            "GMTTimestamp": "2024-11-22T13:43:15Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "GLENDALE HEIGHTS",
            "eventState": "IL",
            "eventZIP": "60139",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "82",
            "additionalProp": null
          },
          {
            "eventType": "Arrived Shipping Partner Facility, USPS Awaiting Item",
            "eventTimestamp": "2024-11-21T23:28:00",
            "GMTTimestamp": "2024-11-21T05:28:33Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "GLENDALE HEIGHTS",
            "eventState": "IL",
            "eventZIP": "60139",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "81",
            "additionalProp": null
          },
          {
            "eventType": "Picked Up By Shipping Partner, USPS Awaiting Item",
            "eventTimestamp": "2024-11-21T17:01:00",
            "eventCountry": null,
            "eventCity": null,
            "eventState": null,
            "eventZIP": null,
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "80",
            "additionalProp": null
          },
          {
            "eventType": "Arrived Shipping Partner Facility, USPS Awaiting Item",
            "eventTimestamp": "2024-11-19T16:24:00",
            "GMTTimestamp": "2024-11-19T21:24:07Z",
            "GMTOffset": "-05:00",
            "eventCountry": null,
            "eventCity": "NIAGARA FALLS",
            "eventState": "NY",
            "eventZIP": "14304",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "81",
            "additionalProp": null
          },
          {
            "eventType": "Shipping Label Created, USPS Awaiting Item",
            "eventTimestamp": "2024-11-19T09:27:00",
            "eventCountry": null,
            "eventCity": null,
            "eventState": null,
            "eventZIP": null,
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "GX",
            "additionalProp": null
          }
        ],
        "trackingNumber": "9261290289104185136058"
      }
      JSON
    )
  end

  def track_usps_in_progress_response
    JSON.parse(
      <<~JSON
      {
        "destinationCity": "MILWAUKEE",
        "destinationState": "WI",
        "destinationZIP": "53207",
        "emailEnabled": "true",
        "expectedDeliveryTimeStamp": "2024-11-29T00:00:00",
        "kahalaIndicator": "false",
        "mailClass": "USPS Ground Advantage<SUP>&#153;</SUP>",
        "mailType": "DM",
        "originCity": "NEW BERLIN",
        "originState": "WI",
        "originZIP": "53151",
        "proofOfDeliveryEnabled": "false",
        "restoreEnabled": "false",
        "RRAMEnabled": "false",
        "RREEnabled": "false",
        "services": [
          "USPS Tracking<SUP>&#174;</SUP>",
          "Up to $100 insurance included"
        ],
        "serviceTypeCode": "022",
        "status": "Arrived at USPS Regional Facility",
        "statusCategory": "Moving Through Network",
        "statusSummary": "Your item arrived at our USPS facility in OAK CREEK WI DISTRIBUTION CENTER on November 26, 2024 at 1:44 am. The item is currently in transit to the destination.",
        "tableCode": "T",
        "uniqueMailPieceID": "164744476",
        "mailPieceIntakeDate": "2024-11-23 06:20:13.000000",
        "trackingEvents": [
          {
            "eventType": "Arrived at USPS Regional Facility",
            "eventTimestamp": "2024-11-26T01:44:00",
            "GMTTimestamp": "2024-11-26T07:44:28Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "OAK CREEK WI DISTRIBUTION CENTER",
            "eventState": null,
            "eventZIP": null,
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "10",
            "additionalProp": null
          },
          {
            "eventType": "Departed Post Office",
            "eventTimestamp": "2024-11-25T18:31:00",
            "GMTTimestamp": "2024-11-25T00:31:21Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "NEW BERLIN",
            "eventState": "WI",
            "eventZIP": "53151",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "SF",
            "additionalProp": null
          },
          {
            "eventType": "USPS in possession of item",
            "eventTimestamp": "2024-11-25T18:26:00",
            "GMTTimestamp": "2024-11-25T00:26:14Z",
            "GMTOffset": "-06:00",
            "eventCountry": null,
            "eventCity": "NEW BERLIN",
            "eventState": "WI",
            "eventZIP": "53151",
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "03",
            "additionalProp": null
          },
          {
            "eventType": "Pre-Shipment, USPS Awaiting Item",
            "eventTimestamp": "2024-11-23T00:00:00",
            "eventCountry": null,
            "eventCity": null,
            "eventState": null,
            "eventZIP": null,
            "firm": null,
            "name": null,
            "authorizedAgent": "false",
            "eventCode": "MA",
            "additionalProp": null
          }
        ],
        "trackingNumber": "9202290317456200135409"
      }
      JSON
    )
  end

  def track_usps_not_found_response
    JSON.parse(
      <<~JSON
      {
        "apiVersion": "/tracking/v3",
        "error": {
          "code": "400",
          "message": "12: A status update is not yet available on your package. It will be available when the shipper provides an update or the package is given to USPS. Check back soon. Sign up for Informed Delivery<SUP>reg;</SUP> to receive notifications for packages addressed to you. - ",
          "errors": [{"title":"12: A status update is not yet available on your package. It will be available when the shipper provides an update or the package is given to USPS. Check back soon. Sign up for Informed Delivery<SUP>reg;</SUP> to receive notifications for packages addressed to you. - ","detail":"","code":"150001"}]
        }
      }
      JSON
    )
  end

  def track_ups_response
    {
      "trackResponse" => {
        "shipment" => [
          {
            "inquiryNumber" => "1Z1202R66698804005",
            "package" => [
              {
                "trackingNumber" => "1Z1202R66698804005",
                "deliveryDate" => [],
                "alternateTrackingNumber" => [
                  {
                    "number" => "123456",
                    "type" => "Q"
                  }
                ],
                "activity" => [
                  {
                    "location" => {
                      "slic" => "9642"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "The package is at the clearing agency awaiting final release.",
                      "statusCode" => "092"
                    },
                    "date" => "20240320",
                    "time" => "190838",
                    "gmtDate" => "20240320",
                    "gmtOffset" => "+08:00",
                    "gmtTime" => "11:08:38"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Changi",
                        "countryCode" => "SG",
                        "country" => "SG"
                      },
                      "slic" => "0009"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Arrived at Facility",
                      "code" => "AR",
                      "statusCode" => "005"
                    },
                    "date" => "20240320",
                    "time" => "070700",
                    "gmtDate" => "20240319",
                    "gmtOffset" => "+08:00",
                    "gmtTime" => "23:07:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Shenzhen",
                        "countryCode" => "CN",
                        "country" => "CN"
                      },
                      "slic" => "0009"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Departed from Facility",
                      "code" => "DP",
                      "statusCode" => "005"
                    },
                    "date" => "20240320",
                    "time" => "032000",
                    "gmtDate" => "20240319",
                    "gmtOffset" => "+08:00",
                    "gmtTime" => "19:20:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Shenzhen",
                        "countryCode" => "CN",
                        "country" => "CN"
                      },
                      "slic" => "3459"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Arrived at Facility",
                      "code" => "AR",
                      "statusCode" => "005"
                    },
                    "date" => "20240319",
                    "time" => "232200",
                    "gmtDate" => "20240319",
                    "gmtOffset" => "+08:00",
                    "gmtTime" => "15:22:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Koeln",
                        "countryCode" => "DE",
                        "country" => "DE"
                      },
                      "slic" => "3459"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Departed from Facility",
                      "code" => "DP",
                      "statusCode" => "005"
                    },
                    "date" => "20240319",
                    "time" => "045000",
                    "gmtDate" => "20240319",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "03:50:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Koeln",
                        "countryCode" => "DE",
                        "country" => "DE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Arrived at Facility",
                      "code" => "AR",
                      "statusCode" => "005"
                    },
                    "date" => "20240319",
                    "time" => "003400",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "23:34:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Lummen",
                        "countryCode" => "BE",
                        "country" => "BE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Departed from Facility",
                      "code" => "DP",
                      "statusCode" => "005"
                    },
                    "date" => "20240318",
                    "time" => "221000",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "21:10:00"
                  },
                  {
                    "location" => {
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package has been released by the government agency.",
                      "code" => "RZ",
                      "statusCode" => "014"
                    },
                    "date" => "20240318",
                    "time" => "213829",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "20:38:29"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Lummen",
                        "countryCode" => "BE",
                        "country" => "BE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package is pending release from a Government Agency. Once they release it, your package will be on its way.",
                      "code" => "RZ",
                      "statusCode" => "012"
                    },
                    "date" => "20240318",
                    "time" => "212334",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "20:23:34"
                  },
                  {
                    "location" => {
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "UPS has received the information needed to submit your package for clearance.",
                      "code" => "BB",
                      "statusCode" => "014"
                    },
                    "date" => "20240318",
                    "time" => "212334",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "20:23:34"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Lummen",
                        "countryCode" => "BE",
                        "country" => "BE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "We have your package",
                      "code" => "OR",
                      "statusCode" => "005"
                    },
                    "date" => "20240318",
                    "time" => "200306",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "19:03:06"
                  },
                  {
                    "location" => {
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package has been released by the government agency.",
                      "code" => "RZ",
                      "statusCode" => "014"
                    },
                    "date" => "20240318",
                    "time" => "183623",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "17:36:23"
                  },
                  {
                    "location" => {
                      "address" => { "city" => "Lummen", "countryCode" => "BE", "country" => "BE" },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "UPS initiated contact with the sender to obtain clearance information. Once received, UPS will submit for clearance.",
                      "code" => "BB",
                      "statusCode" => "058"
                    },
                    "date" => "20240318",
                    "time" => "183623",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "17:36:23"
                  },
                  {
                    "location" => {
                      "address" => { "city" => "Lummen", "countryCode" => "BE", "country" => "BE" },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package is pending release from a Government Agency. Once they release it, your package will be on its way.",
                      "code" => "RZ",
                      "statusCode" => "012"
                    },
                    "date" => "20240318",
                    "time" => "181605",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "17:16:05"
                  },
                  {
                    "location" => { "slic" => "3468" },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package is on the way",
                      "code" => "DA",
                      "statusCode" => "014"
                    },
                    "date" => "20240318",
                    "time" => "181605",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "17:16:05"
                  },
                  {
                    "location" => {
                      "address" => { "city" => "Lummen", "countryCode" => "BE", "country" => "BE" },
                      "slic" => "3484"
                    },
                    "status" => {
                      "type" => "P",
                      "description" => "Pickup Scan ",
                      "code" => "PU",
                      "statusCode" => "038"
                    },
                    "date" => "20240318",
                    "time" => "154403",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "14:44:03"
                  },
                  {
                    "location" => {
                      "address" => { "countryCode" => "BE", "country" => "BE" }
                    },
                    "status" => {
                      "type" => "M",
                      "description" => "Shipper created a label, UPS has not received the package yet. ",
                      "code" => "MP",
                      "statusCode" => "003"
                    },
                    "date" => "20240318",
                    "time" => "124917",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "11:49:17"
                  }
                ],
                "currentStatus" => {
                  "description" => "Customs Clearance in Progress",
                  "code" => "092",
                  "simplifiedTextDescription" => "The package is at the clearing agency awaiting final release."
                },
                "packageAddress" => [
                  {
                    "type" => "ORIGIN",
                    "address" => {
                      "city" => "Brussels",
                      "stateProvince" => "",
                      "countryCode" => "BE",
                      "country" => "BE"
                    }
                  },
                  {
                    "type" => "DESTINATION",
                    "address" => {
                      "city" => "CAIRNS",
                      "stateProvince" => "",
                      "countryCode" => "AU",
                      "country" => "AU"
                    }
                  }
                ],
                "weight" => { "unitOfMeasurement" => "KGS", "weight" => "17.00" },
                "service" => { "code" => "554", "levelCode" => "007", "description" => "UPS Express®" },
                "referenceNumber" => [
                  { "type" => "SHIPMENT", "number" => "11111" },
                  { "type" => "SHIPMENT", "number" => "INVOICE 11111" },
                  { "type" => "SHIPMENT", "number" => "PO11111 / 11111" },
                  { "type" => "PACKAGE", "number" => "INVOICE 11111" },
                  { "type" => "PACKAGE", "number" => "PO11111 / 11111" }
                ],
                "dimension" => {
                  "height" => "51.00",
                  "length" => "52.00",
                  "width" => "51.00",
                  "unitOfDimension" => "CM"
                },
                "packageCount" => 1
              }
            ]
          }
        ]
      }
    }
  end

  def track_ups_left_not_arrived
    {
      "trackResponse" => {
        "shipment" => [
          {
            "inquiryNumber" => "1Z1202R66698804005",
            "package" => [
              {
                "trackingNumber" => "1Z1202R66698804005",
                "deliveryDate" => [],
                "activity" => [
                  {
                    "location" => {
                      "slic" => "9642"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "The package is at the clearing agency awaiting final release.",
                      "statusCode" => "092"
                    },
                    "date" => "20240320",
                    "time" => "190838",
                    "gmtDate" => "20240320",
                    "gmtOffset" => "+08:00",
                    "gmtTime" => "11:08:38"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Changi",
                        "countryCode" => "SG",
                        "country" => "SG"
                      },
                      "slic" => "0009"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Arrived at Facility",
                      "code" => "AR",
                      "statusCode" => "005"
                    },
                    "date" => "20240320",
                    "time" => "070700",
                    "gmtDate" => "20240319",
                    "gmtOffset" => "+08:00",
                    "gmtTime" => "23:07:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Shenzhen",
                        "countryCode" => "CN",
                        "country" => "CN"
                      },
                      "slic" => "0009"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Departed from Facility",
                      "code" => "DP",
                      "statusCode" => "005"
                    },
                    "date" => "20240320",
                    "time" => "032000",
                    "gmtDate" => "20240319",
                    "gmtOffset" => "+08:00",
                    "gmtTime" => "19:20:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Shenzhen",
                        "countryCode" => "CN",
                        "country" => "CN"
                      },
                      "slic" => "3459"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Arrived at Facility",
                      "code" => "AR",
                      "statusCode" => "005"
                    },
                    "date" => "20240319",
                    "time" => "232200",
                    "gmtDate" => "20240319",
                    "gmtOffset" => "+08:00",
                    "gmtTime" => "15:22:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Koeln",
                        "countryCode" => "DE",
                        "country" => "DE"
                      },
                      "slic" => "3459"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Departed from Facility",
                      "code" => "DP",
                      "statusCode" => "005"
                    },
                    "date" => "20240319",
                    "time" => "045000",
                    "gmtDate" => "20240319",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "03:50:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Koeln",
                        "countryCode" => "DE",
                        "country" => "DE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Arrived at Facility",
                      "code" => "AR",
                      "statusCode" => "005"
                    },
                    "date" => "20240319",
                    "time" => "003400",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "23:34:00"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Lummen",
                        "countryCode" => "BE",
                        "country" => "BE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "Departed from Facility",
                      "code" => "DP",
                      "statusCode" => "005"
                    },
                    "date" => "20240318",
                    "time" => "221000",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "21:10:00"
                  },
                  {
                    "location" => {
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package has been released by the government agency.",
                      "code" => "RZ",
                      "statusCode" => "014"
                    },
                    "date" => "20240318",
                    "time" => "213829",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "20:38:29"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Lummen",
                        "countryCode" => "BE",
                        "country" => "BE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package is pending release from a Government Agency. Once they release it, your package will be on its way.",
                      "code" => "RZ",
                      "statusCode" => "012"
                    },
                    "date" => "20240318",
                    "time" => "212334",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "20:23:34"
                  },
                  {
                    "location" => {
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "UPS has received the information needed to submit your package for clearance.",
                      "code" => "BB",
                      "statusCode" => "014"
                    },
                    "date" => "20240318",
                    "time" => "212334",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "20:23:34"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Lummen",
                        "countryCode" => "BE",
                        "country" => "BE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "I",
                      "description" => "We have your package",
                      "code" => "OR",
                      "statusCode" => "005"
                    },
                    "date" => "20240318",
                    "time" => "200306",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "19:03:06"
                  },
                  {
                    "location" => {
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package has been released by the government agency.",
                      "code" => "RZ",
                      "statusCode" => "014"
                    },
                    "date" => "20240318",
                    "time" => "183623",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "17:36:23"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Lummen",
                        "countryCode" => "BE",
                        "country" => "BE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "UPS initiated contact with the sender to obtain clearance information. Once received, UPS will submit for clearance.",
                      "code" => "BB",
                      "statusCode" => "058"
                    },
                    "date" => "20240318",
                    "time" => "183623",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "17:36:23"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Lummen",
                        "countryCode" => "BE",
                        "country" => "BE"
                      },
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package is pending release from a Government Agency. Once they release it, your package will be on its way.",
                      "code" => "RZ",
                      "statusCode" => "012"
                    },
                    "date" => "20240318",
                    "time" => "181605",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "17:16:05"
                  },
                  {
                    "location" => {
                      "slic" => "3468"
                    },
                    "status" => {
                      "type" => "X",
                      "description" => "Your package is on the way",
                      "code" => "DA",
                      "statusCode" => "014"
                    },
                    "date" => "20240318",
                    "time" => "181605",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "17:16:05"
                  },
                  {
                    "location" => {
                      "address" => {
                        "city" => "Lummen",
                        "countryCode" => "BE",
                        "country" => "BE"
                      },
                      "slic" => "3484"
                    },
                    "status" => {
                      "type" => "P",
                      "description" => "Pickup Scan ",
                      "code" => "PU",
                      "statusCode" => "038"
                    },
                    "date" => "20240318",
                    "time" => "154403",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "14:44:03"
                  },
                  {
                    "location" => {
                      "address" => {
                        "countryCode" => "BE",
                        "country" => "BE"
                      }
                    },
                    "status" => {
                      "type" => "M",
                      "description" => "Shipper created a label, UPS has not received the package yet. ",
                      "code" => "MP",
                      "statusCode" => "003"
                    },
                    "date" => "20240318",
                    "time" => "124917",
                    "gmtDate" => "20240318",
                    "gmtOffset" => "+01:00",
                    "gmtTime" => "11:49:17"
                  }
                ],
                "currentStatus" => {
                  "description" => "Customs Clearance in Progress",
                  "code" => "092",
                  "simplifiedTextDescription" => "The package is at the clearing agency awaiting final release."
                },
                "packageAddress" => [
                  {
                    "type" => "ORIGIN",
                    "address" => {
                      "city" => "Brussels",
                      "stateProvince" => "",
                      "countryCode" => "BE",
                      "country" => "BE"
                    }
                  },
                  {
                    "type" => "DESTINATION",
                    "address" => {
                      "city" => "CAIRNS",
                      "stateProvince" => "",
                      "countryCode" => "AU",
                      "country" => "AU"
                    }
                  }
                ],
                "weight" => {
                  "unitOfMeasurement" => "KGS",
                  "weight" => "17.00"
                },
                "service" => {
                  "code" => "554",
                  "levelCode" => "007",
                  "description" => "UPS Express®"
                },
                "referenceNumber" => [
                  {
                    "type" => "SHIPMENT",
                    "number" => "1202R6ZZZZZ"
                  },
                  {
                    "type" => "SHIPMENT",
                    "number" => "INVOICE 3000010221"
                  },
                  {
                    "type" => "SHIPMENT",
                    "number" => "PO22235 / 338343000"
                  },
                  {
                    "type" => "PACKAGE",
                    "number" => "INVOICE 3000043391"
                  },
                  {
                    "type" => "PACKAGE",
                    "number" => "PO22000 / 338343000"
                  }
                ],
                "dimension" => {
                  "height" => "51.00",
                  "length" => "52.00",
                  "width" => "51.00",
                  "unitOfDimension" => "CM"
                },
                "packageCount" => 1
              }
            ]
          }
        ]
      }
    }
  end

  def track_ups_mi_response
    {
      "trackResponse" => {
        "shipment" => [
          {
            "inquiryNumber" => "1Z023E2X0214323462",
            "package" => [
              {
                "accessPointInformation" => {
                  "pickupByDate" => "string"
                },
                "activity" => [{
                  "location" => {"slic"=>"9642"},
                  "status" => {
                    "type"=> "X",
                    "description"=>"The package is at the clearing agency awaiting final release.",
                    "statusCode"=>"092"
                  },
                  "date"=>"20240320",
                  "time"=>"190838",
                  "gmtDate"=>"20240320",
                  "gmtOffset"=>"+08:00",
                  "gmtTime"=>"11:08:38"
                }],
                "additionalAttributes" => [
                  "SENSOR_EVENT"
                ],
                "additionalServices" => [
                  "ADULT_SIGNATURE_REQUIRED",
                  "SIGNATURE_REQUIRED",
                  "ADDITIONAL_HANDLING",
                  "CARBON_NEUTRAL",
                  "UPS_PREMIER_SILVER",
                  "UPS_PREMIER_GOLD",
                  "UPS_PREMIER_PLATINUM"
                ],
                "alternateTrackingNumber" => [
                  {
                    "number" => "123456",
                    "type" => "Q"
                  }
                ],
                "currentStatus" => {
                  "code" => "SR",
                  "description" => "Your package was released by the customs agency.",
                  "simplifiedTextDescription" => "Delivered",
                  "statusCode" => "003",
                  "type" => "X"
                },
                "deliveryDate" => [
                  {
                    "date" => "null",
                    "type" => "null"
                  }
                ],
                "deliveryInformation" => {
                  "location" => "Front Door",
                  "receivedBy" => "",
                  "signature" => {
                    "image" => "null"
                  },
                  "pod" => {
                    "content" => "null"
                  }
                },
                "deliveryTime" => {
                  "endTime" => "string",
                  "startTime" => "string",
                  "type" => "string"
                },
                "milestones" => [
                  {
                    "category" => "null",
                    "code" => "null",
                    "current" => "null",
                    "description" => "null",
                    "linkedActivity" => "null",
                    "state" => "null",
                    "subMilestone" => "null"
                  }
                ],
                "packageAddress" => [
                  {
                    "address" => "null",
                    "attentionName" => "null",
                    "name" => "null",
                    "type" => "null"
                  }
                ],
                "packageCount" => 2,
                "paymentInformation" => [
                  {
                    "amount" => "null",
                    "currency" => "null",
                    "id" => "null",
                    "paid" => "null",
                    "paymentMethod" => "null",
                    "type" => "null"
                  }
                ],
                "referenceNumber" => [
                  {
                    "number" => "null",
                    "type" => "null"
                  }
                ],
                "service" => {
                  "code" => "518",
                  "description" => "UPS Ground",
                  "levelCode" => "011"
                },
                "statusCode" => "string",
                "statusDescription" => "string",
                "suppressionIndicators" => "DETAIL",
                "trackingNumber" => "string",
                "weight" => {
                  "unitOfMeasurement" => "string",
                  "weight" => "string"
                }
              }
            ],
            "userRelation" => "MYCHOICE_HOME",
            "warnings" => [
              {
                "code" => "string",
                "message" => "string"
              }
            ]
          }
        ]
      }
    }
  end

  def track_ups_mi_not_found_response
    {
      "trackResponse" => {
        "shipment" => [{
          "inquiryNumber" => "1Z9912350341235622",
          "warnings" => [{"code" => "TW0001", "message" => "Tracking Information Not Found"}]
        }]
      }
    }
  end

  def track_ups_not_found_response
    {
      "trackResponse" => {
        "shipment" => [{
          "inquiryNumber" => "1Z9912350341235622",
          "warnings" => [{"code" => "TW0001", "message" => "Tracking Information Not Found"}]
        }]
      }
    }
  end

  def track_ups_surepost_response
    track_ups_response
  end

  def track_pitney_bowes_response
    {
      'packageCount' => 1,
      'reattemptDate' => nil,
      'reattemptTime' => nil,
      'signedBy' => nil,
      'senderAddress' => { 'name' => nil, 'address1' => nil, 'address2' => nil, 'address3' => nil, 'city' => nil, 'stateOrProvince' => nil, 'postalCode' => nil, 'country' => nil },
      'requestedIdentifier' => '92023903406069000000000285',
      'clientId' => nil, 'trackingNumber' => '4205690192023903406069000000000285',
      'referenceNumber' => 'W435706480',
      'smartLabelBarcode' => '725109850102377001010000000000W435706480N',
      'carrier' => 'PBCS',
      'serviceName' => 'Parcel Return Service',
      'serviceCode' => 'RP',
      'estimatedDeliveryDate' => nil,
      'estimatedDeliveryTime' => nil,
      'estimatedDeliveryTimeOffset' => nil,
      'weight' => '4.06',
      'weightUOM' => 'LBS',
      'dimension' => nil,
      'deliveryDate' => nil,
      'deliveryTime' => nil,
      'deliveryTimeOffset' => nil,
      'deliveryProofUrl' => nil,
      'shipDate' => nil, 'shipTime' => nil, 'shipTimeOffset' => nil,
      'destinationAddress' => { 'name' => nil, 'address1' => nil, 'address2' => nil, 'address3' => nil, 'city' => nil, 'stateOrProvince' => nil, 'country' => nil, 'postalCode' => nil },
      'deliveryLocation' => nil,
      'deliveryLocationDescription' => nil,
      'scanDetailsList' => [
        { 'standardizedEventCode' => 'LC', 'standardizedEventDescription' => 'Label created', 'l1Code' => 'LC', 'l1Description' => 'Label Created', 'eventDate' => '2024-07-24', 'eventTime' => '12:20:26', 'eventTimeOffset' => '-07:00', 'trackingUrl' => nil, 'latitude' => nil, 'longitude' => nil, 'locationUnit' => nil, 'eventLeg' => 'FML', 'eventType' => 'RTN', 'authorizedAgent' => nil, 'scanType' => 'LC', 'scanDescription' => 'Label created', 'packageStatus' => 'Manifest', 'l2Description' => nil, 'eventCity' => 'Olympia', 'eventStateOrProvince' => 'WA', 'postalCode' => '98501-6202', 'country' => 'US' }
      ],
      'currentStatus' => { 'standardizedEventCode' => 'LC', 'standardizedEventDescription' => 'Label created', 'l1Code' => 'LC', 'l1Description' => 'Label Created', 'eventDate' => '2024-07-24', 'eventTime' => '12:20:26', 'eventTimeOffset' => '-07:00', 'trackingUrl' => nil, 'latitude' => nil, 'longitude' => nil, 'locationUnit' => nil, 'eventLeg' => 'FML', 'eventType' => 'RTN', 'authorizedAgent' => nil, 'packageStatus' => 'Manifest', 'scanType' => 'LC', 'scanDescription' => 'Label created', 'l2Description' => nil, 'eventCity' => 'Olympia', 'eventStateOrProvince' => 'WA', 'postalCode' => '98501-6202', 'country' => 'US' },
      'status' => 'Manifest',
      'updatedDate' => '2024-07-24',
      'updatedTime' => '12:20:26',
      'lastPackageStatusLocation' => 'Olympia,WA,98501-6202'
    }
  end

  def track_fedex_response
    <<-JSON
    {
      "transactionId": "b2ff9d63-7e07-4e43-a201-bdb936c15cc2",
      "customerTransactionId": "AnyCo_order123456789",
      "output": {
        "completeTrackResults": [
          {
            "trackingNumber": "122816215025810",
            "trackResults": [
              {
                "trackingNumberInfo": {
                  "trackingNumber": "122816215025810",
                  "carrierCode": "FDXE",
                  "trackingNumberUniqueId": "245822~123456789012~FDEG"
                },
                "additionalTrackingInfo": {
                  "hasAssociatedShipments": false,
                  "nickname": "shipment nickname",
                  "packageIdentifiers": [
                    {
                      "type": "SHIPPER_REFERENCE",
                      "value": "ASJFGVAS",
                      "trackingNumberUniqueId": "245822~123456789012~FDEG"
                    }
                  ],
                  "shipmentNotes": "shipment notes"
                },
                "distanceToDestination": {
                  "units": "KM",
                  "value": 685.7
                },
                "consolidationDetail": [],
                "meterNumber": "12345",
                "returnDetail": {},
                "serviceDetail": {
                  "description": "FedEx Freight Economy.",
                  "shortDescription": "FL",
                  "type": "FEDEX_FREIGHT_ECONOMY"
                },
                "destinationLocation": {
                  "locationId": "SEA",
                  "locationContactAndAddress": {
                    "address": {
                      "addressClassification": "BUSINESS",
                      "residential": false,
                      "streetLines": [
                        "1043 North Easy Street",
                        "Suite 999"
                      ],
                      "city": "SEATTLE",
                      "stateOrProvinceCode": "WA",
                      "postalCode": "98101",
                      "countryCode": "US",
                      "countryName": "United States"
                    }
                  },
                  "locationType": "FEDEX_SHIPSITE"
                },
                "latestStatusDetail": {
                  "date": "2024-08-12T15:18:10 -0500",
                  "derivedStatus": "Delivered",
                  "scanLocation": {
                    "addressClassification": "BUSINESS",
                    "residential": false,
                    "streetLines": [
                      "1043 North Easy Street",
                      "Suite 999"
                    ],
                    "city": "SEATTLE",
                    "stateOrProvinceCode": "WA",
                    "postalCode": "98101",
                    "countryCode": "US",
                    "countryName": "United States"
                  },
                  "locationId": "SEA",
                  "locationType": "CUSTOMS_BROKER",
                  "exceptionDescription": "Package available for clearance",
                  "eventDescription": "Picked Up",
                  "eventType": "PU",
                  "derivedStatusCode": "DL",
                  "exceptionCode": "A25",
                  "delayDetail": {
                    "type": "",
                    "subType": "",
                    "status": ""
                  }
                },
                "serviceCommitMessage": {
                  "message": "No scheduled delivery date available at this time.",
                  "type": "ESTIMATED_DELIVERY_DATE_UNAVAILABLE"
                },
                "informationNotes": [
                  {
                    "code": "CLEARANCE_ENTRY_FEE_APPLIES",
                    "description": "this is an informational message"
                  }
                ],
                "error": {},
                "specialHandlings": [
                  {
                    "description": "Deliver Weekday",
                    "type": "DELIVER_WEEKDAY",
                    "paymentType": "OTHER"
                  }
                ],
                "availableImages": [
                  {
                    "size": "LARGE",
                    "type": "BILL_OF_LADING"
                  }
                ],
                "deliveryDetails": {
                  "receivedByName": "Reciever",
                  "destinationServiceArea": "EDDUNAVAILABLE",
                  "destinationServiceAreaDescription": "Appointment required",
                  "locationDescription": "Receptionist/Front Desk",
                  "actualDeliveryAddress": {
                    "addressClassification": "BUSINESS",
                    "residential": false,
                    "streetLines": [
                      "1043 North Easy Street",
                      "Suite 999"
                    ],
                    "city": "SEATTLE",
                    "stateOrProvinceCode": "WA",
                    "postalCode": "98101",
                    "countryCode": "US",
                    "countryName": "United States"
                  },
                  "deliveryToday": false,
                  "locationType": "APARTMENT_OFFICE",
                  "signedByName": "Reciever",
                  "officeOrderDeliveryMethod": "Courier",
                  "deliveryAttempts": "0",
                  "deliveryOptionEligibilityDetails": [
                    {
                      "option": "INDIRECT_SIGNATURE_RELEASE",
                      "eligibility": "INELIGIBLE"
                    }
                  ]
                },
                "scanEvents": [
                  {
                    "date": "2024-08-12T15:18:10 -0500",
                    "derivedStatus": "Order Created",
                    "scanLocation": {
                      "addressClassification": "BUSINESS",
                      "residential": false,
                      "streetLines": [
                        "1043 North Easy Street",
                        "Suite 999"
                      ],
                      "city": "SEATTLE",
                      "stateOrProvinceCode": "WA",
                      "postalCode": "98101",
                      "countryCode": "US",
                      "countryName": "United States"
                    },
                    "locationId": "SEA",
                    "locationType": "CUSTOMS_BROKER",
                    "exceptionDescription": "Package available for clearance",
                    "eventDescription": "Picked Up",
                    "eventType": "PU",
                    "derivedStatusCode": "OC",
                    "exceptionCode": "A25",
                    "delayDetail": {
                      "type": "",
                      "subType": "",
                      "status": ""
                    }
                  },
                  {
                    "date": "2024-08-12T15:18:10 -0500",
                    "derivedStatus": "Picked UP",
                    "scanLocation": {
                      "addressClassification": "BUSINESS",
                      "residential": false,
                      "streetLines": [
                        "1043 North Easy Street",
                        "Suite 999"
                      ],
                      "city": "SEATTLE",
                      "stateOrProvinceCode": "WA",
                      "postalCode": "98101",
                      "countryCode": "US",
                      "countryName": "United States"
                    },
                    "locationId": "SEA",
                    "locationType": "CUSTOMS_BROKER",
                    "exceptionDescription": "Package available for clearance",
                    "eventDescription": "Picked Up",
                    "eventType": "PU",
                    "derivedStatusCode": "DP",
                    "exceptionCode": "A25",
                    "delayDetail": {
                      "type": "",
                      "subType": "",
                      "status": ""
                    }
                  },
                  {
                    "date": "2024-08-12T15:18:10 -0500",
                    "derivedStatus": "Out for Delivery",
                    "scanLocation": {
                      "addressClassification": "BUSINESS",
                      "residential": false,
                      "streetLines": [
                        "1043 North Easy Street",
                        "Suite 999"
                      ],
                      "city": "SEATTLE",
                      "stateOrProvinceCode": "WA",
                      "postalCode": "98101",
                      "countryCode": "US",
                      "countryName": "United States"
                    },
                    "locationId": "SEA",
                    "locationType": "CUSTOMS_BROKER",
                    "exceptionDescription": "Package available for clearance",
                    "eventDescription": "Picked Up",
                    "eventType": "PU",
                    "derivedStatusCode": "OD",
                    "exceptionCode": "A25",
                    "delayDetail": {
                      "type": "",
                      "subType": "",
                      "status": ""
                    }
                  },
                  {
                    "date": "2024-08-12T15:18:10 -0500",
                    "derivedStatus": "Delivered",
                    "scanLocation": {
                      "addressClassification": "BUSINESS",
                      "residential": false,
                      "streetLines": [
                        "1043 North Easy Street",
                        "Suite 999"
                      ],
                      "city": "SEATTLE",
                      "stateOrProvinceCode": "WA",
                      "postalCode": "98101",
                      "countryCode": "US",
                      "countryName": "United States"
                    },
                    "locationId": "SEA",
                    "locationType": "CUSTOMS_BROKER",
                    "exceptionDescription": "Package available for clearance",
                    "eventDescription": "Picked Up",
                    "eventType": "PU",
                    "derivedStatusCode": "DL",
                    "exceptionCode": "A25",
                    "delayDetail": {
                      "type": "",
                      "subType": "",
                      "status": ""
                    }
                  }
                ],
                "dateAndTimes": [
                  {
                    "dateTime": "2007-09-27T00:00:00",
                    "type": "ACTUAL_DELIVERY"
                  }
                ],
                "packageDetails": {
                  "physicalPackagingType": "BARREL",
                  "sequenceNumber": "45",
                  "undeliveredCount": "7",
                  "packagingDescription": {
                    "description": "FedEx Pak",
                    "type": "FEDEX_PAK"
                  },
                  "count": "1",
                  "weightAndDimensions": {
                    "weight": [
                      {
                        "unit": "LB",
                        "value": "22222.0"
                      }
                    ],
                    "dimensions": [
                      {
                        "length": 100,
                        "width": 50,
                        "height": 30,
                        "units": "CM"
                      }
                    ]
                  },
                  "packageContent": [],
                  "contentPieceCount": "100",
                  "declaredValue": {
                    "currency": "USD",
                    "value": 56.8
                  }
                },
                "goodsClassificationCode": "goodsClassificationCode",
                "holdAtLocation": {
                  "locationId": "SEA",
                  "locationContactAndAddress": {
                    "address": {
                      "addressClassification": "BUSINESS",
                      "residential": false,
                      "streetLines": [
                        "1043 North Easy Street",
                        "Suite 999"
                      ],
                      "city": "SEATTLE",
                      "stateOrProvinceCode": "WA",
                      "postalCode": "98101",
                      "countryCode": "US",
                      "countryName": "United States"
                    }
                  },
                  "locationType": "FEDEX_SHIPSITE"
                },
                "customDeliveryOptions": [
                  {
                    "requestedAppointmentDetail": {
                      "date": "2019-05-07",
                      "window": [
                        {
                          "description": "Description field",
                          "window": {
                            "begins": "2021-10-01T08:00:00",
                            "ends": "2021-10-15T00:00:00-06:00"
                          },
                          "type": "ESTIMATED_DELIVERY"
                        }
                      ]
                    },
                    "description": "Redirect the package to the hold location.",
                    "type": "REDIRECT_TO_HOLD_AT_LOCATION",
                    "status": "HELD"
                  }
                ],
                "estimatedDeliveryTimeWindow": {
                  "description": "Description field",
                  "window": {
                    "begins": "2024-08-14T15:18:10",
                    "ends": "2024-08-19T15:18:10"
                  },
                  "type": "ESTIMATED_DELIVERY"
                },
                "pieceCounts": [
                  {
                    "count": "35",
                    "description": "picec count description",
                    "type": "ORIGIN"
                  }
                ],
                "originLocation": {
                  "locationId": "SEA",
                  "locationContactAndAddress": {
                    "address": {
                      "addressClassification": "BUSINESS",
                      "residential": false,
                      "streetLines": [
                        "1043 North Easy Street",
                        "Suite 999"
                      ],
                      "city": "SEATTLE",
                      "stateOrProvinceCode": "WA",
                      "postalCode": "98101",
                      "countryCode": "US",
                      "countryName": "United States"
                    }
                  }
                },
                "recipientInformation": {
                  "address": {
                    "addressClassification": "BUSINESS",
                    "residential": false,
                    "streetLines": [
                      "1043 North Easy Street",
                      "Suite 999"
                    ],
                    "city": "SEATTLE",
                    "stateOrProvinceCode": "WA",
                    "postalCode": "98101",
                    "countryCode": "US",
                    "countryName": "United States"
                  }
                },
                "standardTransitTimeWindow": {
                  "description": "Description field",
                  "window": {
                    "begins": "2021-10-01T08:00:00",
                    "ends": "2021-10-15T00:00:00-06:00"
                  },
                  "type": "ESTIMATED_DELIVERY"
                },
                "shipmentDetails": {
                  "contents": [
                    {
                      "itemNumber": "RZ5678",
                      "receivedQuantity": "13",
                      "description": "pulyurethane rope",
                      "partNumber": "RK1345"
                    }
                  ],
                  "beforePossessionStatus": false,
                  "weight": [
                    {
                      "unit": "LB",
                      "value": "22222.0"
                    }
                  ],
                  "contentPieceCount": "3333",
                  "splitShipments": [
                    {
                      "pieceCount": "10",
                      "statusDescription": "status",
                      "timestamp": "2019-05-07T08:00:07",
                      "statusCode": "statuscode"
                    }
                  ]
                },
                "reasonDetail": {
                  "description": "Wrong color",
                  "type": "REJECTED"
                },
                "availableNotifications": [
                  "ON_DELIVERY",
                  "ON_EXCEPTION"
                ],
                "shipperInformation": {
                  "address": {
                    "addressClassification": "BUSINESS",
                    "residential": false,
                    "streetLines": [
                      "1043 North Easy Street",
                      "Suite 999"
                    ],
                    "city": "SEATTLE",
                    "stateOrProvinceCode": "WA",
                    "postalCode": "98101",
                    "countryCode": "US",
                    "countryName": "United States"
                  }
                },
                "lastUpdatedDestinationAddress": {
                  "addressClassification": "BUSINESS",
                  "residential": false,
                  "streetLines": [
                    "1043 North Easy Street",
                    "Suite 999"
                  ],
                  "city": "SEATTLE",
                  "stateOrProvinceCode": "WA",
                  "postalCode": "98101",
                  "countryCode": "US",
                  "countryName": "United States"
                }
              }
            ]
          }
        ]
      }
    }
    JSON
  end

  def track_fedex_not_found_response
    {
      "transactionId"=>"5243a255-b1ab-454f-884c-0a2ffd49a7aa",
      "customerTransactionId"=>"a22ada43-ea34-45c9-9141-bddbde189d35",
      "output"=>{
        "completeTrackResults"=>[{
          "trackingNumber"=>"02399989320920003663",
          "trackResults"=>[{
            "trackingNumberInfo"=>{"trackingNumber"=>"02399989320920003663", "trackingNumberUniqueId"=>"", "carrierCode"=>""},
            "error"=>{
              "code"=>"TRACKING.TRACKINGNUMBER.NOTFOUND",
              "message"=>"The tracking number you entered can't be found right now. Please check the number with the shipper or try again later."
            }
          }]
        }]
      }
    }
  end
end

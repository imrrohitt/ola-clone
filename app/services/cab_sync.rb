require 'httparty'

class CabSync
  include HTTParty
  attr_accessor :base_url , :headers

  def initialize
    @base_url = 'https://gocars.goibibo.com'
    @headers = {
      'Accept' => 'application/json',
      'User-Agent' => 'Your User Agent String',
      'Content-Type' => 'application/json',

    }
  end
  def fetch_data(payload)
    url = "#{@base_url}/api/apps/v1/booking/srp/info/"
    response = HTTParty.post(url, headers: @headers, body: payload.to_json)

    if response.success?
      return response.parsed_response
    else
      raise "API request failed with status code #{response.code}"
    end
  end


  def sync_data
    request_payload = {
      call_source: "GOCARS",
      destination_city_name: "mysuru",
      destination_id: "ChIJ-S5XHThwrzsRbTn4wOjsiSs",
      destination_lat: "",
      destination_lng: "",
      destination_lob_city: "",
      destination_locus: {},
      destination_name: "Mysuru, Karnataka, India",
      filter_data: { sf: [], msf: [], pf: {} },
      flavour: "cars_mweb",
      flow_name: "direct-cabs",
      is_instant: false,
      is_ryde_v2: true,
      multicity: false,
      pay_version: "v3",
      rf: "os",
      ryde_ab_check: true,
      sem_flow: false,
      seo_flow: false,
      skip_payment_modes: false,
      sorted_blusmart: false,
      source_city_name: "bengaluru",
      source_id: "ChIJbU60yXAWrjsR4E9-UejD3_g",
      source_lat: "",
      source_lng: "",
      source_lob_city: "",
      source_locus: {},
      source_name: "Bangalore, Karnataka, India",
      start_time: "2023-10-28 10:00:00",
      stop_overs: [],
      toll_paid: false,
      trip_type: "ONE_WAY",
      vertical: "GoCars"
    }

    data = fetch_data(request_payload)
    puts "#{data}"
    # Process and sync the data with your Rails application
    # You can store it in your database or perform other actions as needed
    # For example, you can create or update records in your models.

    # Example of creating a record in your model:
    # MyModel.create(data)
  end



end

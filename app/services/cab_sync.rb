require 'httparty'

class CabSync
  include HTTParty
  attr_accessor :base_url

  def initialize
    @base_url = 'https://gocars.goibibo.com'
    @headers = {
      'Content-Type' => 'application/json',
      'Host' => 'gocars.goibibo.com', # Include the 'Host' header
      'Content-Length' => 'YOUR_CONTENT_LENGTH' # Replace with the actual content length
    }
  end

  def fetch_data(payload)
    binding.pry
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
      "source_name": "Bangalore, Karnataka, India",
      "source_id": "ChIJbU60yXAWrjsR4E9-UejD3_g", # Use lowercase 'd' for 'ejd3_g'
      "call_source": "GOCARS",
      "channel_type": "",
      "destination_id": "ChIJ-S5XHThwrzsRbTn4wOjsiSs",
      "destination_name": "Mysuru, Karnataka, India",
      "device_id": "dummy",
      "end_time": "",
      "filter_data": {},
      "flavour": "cars_dweb",
      "rf": "ow",
      "search_id": "",
      "sem_flow": false,
      "seo_flow": false,
      "start_time": "2023-10-26 10:00:00",
      "trip_type": "ONE_WAY",
      "vehicle_key": ""
    }

    data = fetch_data(request_payload)
    
    # Process and sync the data with your Rails application
    # You can store it in your database or perform other actions as needed
    # For example, you can create or update records in your models.
    
    # Example of creating a record in your model:
    # MyModel.create(data)
  end
end

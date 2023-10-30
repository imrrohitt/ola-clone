require 'httparty'

class Base
  include HTTParty
  attr_accessor :base_url, :headers

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

  def map_and_save_data(data)
  end

  def sync_data
    request_payload = build_request_payload
    data = fetch_data(request_payload)
    map_and_save_data(data)
    puts "Data has been mapped and saved to the database."
  end
end

require_relative 'base'

class CabSync < Base
  def build_request_payload
    # request_payload = {
    #   call_source: "GOCARS",
    #   destination_city_name: "mysuru",
    #   destination_id: "ChIJ-S5XHThwrzsRbTn4wOjsiSs",
    #   destination_lat: "",
    #   destination_lng: "",
    #   destination_lob_city: "",
    #   destination_locus: {},
    #   destination_name: "Mysuru, Karnataka, India",
    #   filter_data: { sf: [], msf: [], pf: {} },
    #   flavour: "cars_mweb",
    #   flow_name: "direct-cabs",
    #   is_instant: false,
    #   is_ryde_v2: true,
    #   multicity: false,
    #   pay_version: "v3",
    #   rf: "os",
    #   ryde_ab_check: true,
    #   sem_flow: false,
    #   seo_flow: false,
    #   skip_payment_modes: false,
    #   sorted_blusmart: false,
    #   source_city_name: "bengaluru",
    #   source_id: "ChIJbU60yXAWrjsR4E9-UejD3_g",
    #   source_lat: "",
    #   source_lng: "",
    #   source_lob_city: "",
    #   source_locus: {},
    #   source_name: "Bangalore, Karnataka, India",
    #   start_time: "2023-10-28 10:00:00",
    #   stop_overs: [],
    #   toll_paid: false,
    #   trip_type: "ONE_WAY",
    #   vertical: "GoCars"
    # } 
    {
  "call_source": "GOCARS",
  "destination_city_name": "gangamuthanahalli",
  "destination_id": "ChIJkT3xL30drjsRHk-8B1n3vvo",
  "destination_lat": "",
  "destination_lng": "",
  "destination_lob_city": "",
  "destination_locus": {
    "country": "IN",
    "name": "Gangamuthanahalli",
    "type": "CITY"
  },
  "country": "IN",
  "name": "Gangamuthanahalli",
  "type": "CITY",
  "destination_name": "Bangalore Airport Lounge, Kempegowda Int'l Airport Rd, A - Block, Gangamuthanahalli, Karnataka, India",
  "filter_data": {
    "sf": [],
    "msf": [],
    "pf": {}
  },
  "msf": [],
  "pf": {},
  "sf": [],
  "flavour": "cars_mweb",
  "flow_name": "direct-cabs",
  "is_instant": false,
  "is_ryde_v2": true,
  "multicity": false,
  "pay_version": "v3",
  "rf": "os",
  "ryde_ab_check": true,
  "sem_flow": false,
  "seo_flow": false,
  "skip_payment_modes": false,
  "sorted_blusmart": false,
  "source_city_name": "bengaluru",
  "source_id": "ChIJbU60yXAWrjsR4E9-UejD3_g",
  "source_lat": "",
  "source_lng": "",
  "source_lob_city": "",
  "source_locus": {},
  "source_name": "Bangalore, Karnataka, India",
  "start_time": "2023-10-31 10:00:00",
  "stop_overs": [],
  "toll_paid": false,
  "trip_type": "ONE_WAY",
  "vertical": "GoCars"
}

  end

  def map_and_save_data(data)
    vehicle_data = data["vehicle_data"]
    vehicle_data.each do |vehicle|
      cab_data = vehicle.dig("c_d", 0)
      cab_facilities = cab_data["cab_facilities"]
      offers = cab_data["offers"]
  
      new_vehicle = VehicleDetail.new(
        title: vehicle.dig("t_c", "t"),
        subtitle: vehicle.dig("t_c", "st"),
        img_url: vehicle.dig("t_c", "img_url"),
        category: vehicle.dig("t_c", "cat"),
        details: vehicle.dig("t_c", "detail_str"),
        pax_info: vehicle.dig("t_c", "pax_info"),
        category_key: vehicle.dig("t_c", "ctg_key"),
        is_ryde: cab_data["is_ryde"],
        review_rating: cab_data.dig("review", "t"),
        review_bc: cab_data.dig("review", "bc"),
        review_brc: cab_data.dig("review", "brc"),
        pay_type: cab_data.dig("pay_info", "t"),
        so_price: cab_data.dig("pay_info", "so_price"),
        price: cab_data.dig("pay_info", "price"),
        price_msg: cab_data.dig("pay_info", "price_msg"),
        cta_text: cab_data.dig("pay_info", "cta_text"),
        per_off: cab_data.dig("pay_info", "per_off"),
        sod: cab_data.dig("pay_info", "sod"),
        e_f_r: cab_data.dig("pay_info", "e_f_r"),
        base_fare: cab_data.dig("pay_info", "base_fare"),
        is_zero_booking: cab_data["is_zero_booking"],
        cab_facilities: cab_facilities,
        d_s: cab_data["d_s"],
        t_g_i: cab_data["t_g_i"],
        offers: offers,
        dbg: cab_data["dbg"]
      )
  
      new_vehicle.save
    end
  end
end

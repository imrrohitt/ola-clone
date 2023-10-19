class Api::V1::LocationsController < ApplicationController
    def index
    end

    def store_location
      latitude = params[:latitude]
      longitude = params[:longitude]

      # Store the location data in your database
      Location.create(latitude: latitude, longitude: longitude)

      render json: { message: 'Location stored successfully' }
    end
  end
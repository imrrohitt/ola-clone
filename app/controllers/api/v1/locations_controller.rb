class Api::V1::LocationsController < ApplicationController
    def create
      location = Location.new(location_params)
  
      if location.save
        render json: { message: 'Location saved successfully' }, status: :created
      else
        render json: { errors: location.errors.full_messages }, status: :bad_request
      end
    end
    private
  
    def location_params
      params.require(:location).permit(:latitude, :longitude)
    end
end
  
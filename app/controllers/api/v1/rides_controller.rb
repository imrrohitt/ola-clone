class Api::V1::RidesController < ApplicationController
    before_action :authenticate_user! # Ensure the user is authenticated
    
    def create
      rider = current_user
      driver = Driver.find(params[:driver_id])
  
      if rider && driver 
        # Find the associated vehicle for the driver, assuming the driver has an active vehicle
        vehicle_d = driver.vehicle_type
        vehicle = Vehicle.find_by(vehicle_type: vehicle_d)
        if vehicle
          ride = Ride.create(rider: rider, driver: driver, vehicle: vehicle, status: 'requested')
          render json: RideSerializer.new(ride).serializable_hash
        else
          render json: { error: 'No active vehicle found for the selected driver.' }, status: :bad_request
        end
      else
        render json: { error: 'Unable to request ride. Please check your input.' }, status: :bad_request
      end
    end
end
  
class Api::V1::DriversController < ApplicationController

    def index
        vehicle_type = params[:vehicle_type]
        drivers = Driver.where(vehicle_type: vehicle_type)
        render json: DriverSerializer.new(drivers).serializable_hash, status: :ok
    end
end
class Api::V1::VehiclesController < ApplicationController

    def index
        vehicles = Vehicle.all
        render json: VehicleSerializer.new(vehicles).serializable_hash, status: :ok
    end
end
  
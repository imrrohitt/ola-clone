class VehicleSerializer
    include JSONAPI::Serializer
    attributes :id, :vehicle_type, :license_plate, :status, :active
  end
  
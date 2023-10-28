class DriverSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :license_number, :vehicle_type, :phone, :email 
  end

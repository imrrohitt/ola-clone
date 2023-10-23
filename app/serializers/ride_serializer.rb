class RideSerializer
  include JSONAPI::Serializer
  attributes :rider_id, :driver, :vehicle, :status
end

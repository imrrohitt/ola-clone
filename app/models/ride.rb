class Ride < ApplicationRecord
  belongs_to :rider, class_name: 'User'
  belongs_to :driver
  belongs_to :vehicle
end

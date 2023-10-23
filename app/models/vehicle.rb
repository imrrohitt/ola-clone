class Vehicle < ApplicationRecord
 belongs_to :driver, optional: true
end
  
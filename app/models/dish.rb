class Dish < ApplicationRecord
  belongs_to :restaurant
  validates :name, :price, :description, :status, presence: true
end

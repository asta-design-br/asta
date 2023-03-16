class Address < ApplicationRecord
  belongs_to :addressable_id, polymorphic: true

  validates :street, :number, :neighborhood, :city, :state, presence: true
end

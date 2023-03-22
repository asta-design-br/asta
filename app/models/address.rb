class Address < ApplicationRecord
  belongs_to :asta_addressable, polymorphic: true

  validates :street, :number, :neighborhood, :city, :state, presence: true
  validates :state, length: { is: 2 }
end

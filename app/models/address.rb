class Address < ApplicationRecord
  belongs_to :addressable_id, polymorphic: true

  validates 
end

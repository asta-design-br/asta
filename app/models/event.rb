class Event < ApplicationRecord
  belongs_to :users
  has_one :address, as: :addressable
  has_one :phone, as: :phonable_id
  has_many_attached :visual_references
  validates :title, length: { maximum: 50 }, presence: true
  validates :description, length: { minimum: 50 }, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end

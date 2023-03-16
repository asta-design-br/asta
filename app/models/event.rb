class Event < ApplicationRecord
  has_many :users, :active_storage_attachments
  validates :title, length: { maximum: 50 }, presence: true
  validates :description, length: { minimum: 50 }, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end

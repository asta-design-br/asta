class Product < ApplicationRecord
  belongs_to :event

  validates :name, length: { maximum: 50, too_long: '%<count> characters is the maximum allowed' }
  validates :description, length: { minimum: 50, too_short: 'is too short (minimum is %<count> characters)' }
  validates :format, presence: true
  validates :format, inclusion: { in: %w[digital printed audio video], message: '%<value> is not a valid role.' }
  validates :required_time, numericality: { only_integer: true, greater_than: 0 }
  # validates :category, inclusion: { in: %w[flyer poster video], message: '%<value> is not a valid role.' }

  validate :check_presence_of_pixels_and_mm

  def check_presence_of_pixels_and_mm
    
  end


end

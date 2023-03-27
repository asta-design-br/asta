class Product < ApplicationRecord
  belongs_to :event

  validates :name, length: { maximum: 50, too_long: '%<count> characters is the maximum allowed' }
  validates :description, length: { minimum: 50, too_short: 'is too short (minimum is %<count> characters)' }
  validates :format, presence: true
  validates :format, inclusion: { in: %w[digital printed audio video], message: '%<value> is not a valid role.' }
  validates :required_time, numericality: { only_integer: true, greater_than: 0 }
  # validates :category, inclusion: { in: %w[flyer poster video], message: '%<value> is not a valid role.' }

  validate :check_presence_of_pixels_and_mm

  def check_presence_of_mm
    mm_height.positive? && mm_width.positive? if pixels_height.nil? && pixels_width.nil?
  end

  def check_presence_of_pixels
    pixels_height.positive? && pixels_width.positive? if mm_height.nil? && mm_width.nil?
  end

  def check_presence_of_milliseconds_length
    validates :milliseconds_length, presence: true if format == 'audio' || format == 'video'
  end

end

class Product < ApplicationRecord
  belongs_to :event

  validates :name, :format, presence: true
  validates :name, length: { maximum: 50, too_long: '%<count> characters is the maximum allowed' }
  validates :description, length: { minimum: 50, too_short: 'is too short (minimum is %<count> characters)' }
  validates :product_format, inclusion: { in: %w[digital printed audio video], message: '%<value> is not a valid format.' }
  validates :required_time, numericality: { only_integer: true, greater_than: 0 }
  validates :category, inclusion: { in: %w[flyer poster sticker backdrop audio video], message: '%<value> is not a valid role.' }

  validate :check_presence_of_pixels, :check_presence_of_mm, :check_presence_of_milliseconds_length

  def check_presence_of_pixels
    pixels_height.positive? && pixels_width.positive? if mm_height.nil? && mm_width.nil?

    # errors.add(:start_time, 'can\'t be in the past')
  end

  def check_presence_of_mm
    mm_height.positive? && mm_width.positive? if pixels_height.nil? && pixels_width.nil?
  end

  def check_presence_of_milliseconds_length
    milliseconds_length.positive? if product_format == 'audio' || product_format == 'video'
  end
end

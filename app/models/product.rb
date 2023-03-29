class Product < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :name, length: { maximum: 50, too_long: '50 characters is the maximum allowed' }
  validates :description, length: { minimum: 50, too_short: 'is too short (minimum is 50 characters)' }
  validates :product_format, inclusion: { in: %w[digital printed audio video], message: 'this is not a valid format.' }
  validates :category, inclusion: { in: %w[flyer poster sticker backdrop audio video], message: 'this is not a valid role.' }

  validate :check_required_time

  def check_required_time
    if product_format == 'audio' || product_format == 'video'
      if required_time.nil?
        errors.add(
          :required_time,
          'must exist'
        )
      elsif
        required_time.zero?
        errors.add(
          :required_time,
          'should be greater than zero'
        )
      else
        required_time.positive?
      end
    else
      required_time.nil?
    end


  end

  # validate :check_presence_of_pixels, :check_presence_of_mm, :check_presence_of_milliseconds_length

  # def check_presence_of_pixels
  #   pixels_height.positive? && pixels_width.positive? if mm_height.nil? && mm_width.nil?

  #   errors.add(
  #     :pixels_height,
  #     'must have pixels or milimeters height'
  #   )

  #   errors.add(
  #     :pixels_width,
  #     'must have pixels or milimeters width'
  #   )
  # end

  # def check_presence_of_mm
  #   mm_height.positive? && mm_width.positive? if pixels_height.nil? && pixels_width.nil?

  #   errors.add(
  #     :mm_height,
  #     'must have pixels or milimeters height'
  #   )

  #   errors.add(
  #     :mm_width,
  #     'must have pixels or milimeters width'
  #   )
  # end

  # def check_presence_of_milliseconds_length
  #   milliseconds_length.positive? if product_format == 'audio' || product_format == 'video'
  # end
end

class Product < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :name, length: { maximum: 50, too_long: '50 characters is the maximum allowed' }
  validates :description, length: { minimum: 50, too_short: 'this too short (minimum is 50 characters)' }
  validates :product_format, inclusion: { in: %w[digital printed audio video], message: 'this is not a valid format.' }
  validates :category, inclusion: { in: %w[flyer poster sticker backdrop audio video], message: 'this is not a valid role.' }
  validates :required_time, numericality: { only_integer: true, grater_than: 0, message: 'should be greater than 0' }

  validate :check_milliseconds_length#, :check_presence_of_pixels_or_milimeters

  def check_milliseconds_length
    if product_format == 'audio' || product_format == 'video'
      if milliseconds_length.nil? || milliseconds_length.zero?
        errors.add(
          :milliseconds_length,
          'must exist and be greater than zero'
        )
      else
        milliseconds_length.positive?
      end
    else
      milliseconds_length.nil?
    end
  end

  # def check_presence_of_pixels_or_milimeters
  #   if product_format == 'digital' || product_format == 'printed'
  #     if pixels_height.nil? && pixels_width.nil? && mm_height.nil? && mm_width.nil?
  #       errors.add(
  #         :pixels_height, :pixels_width, :mm_height, :mm_width,
  #         'pixels or milimeters height/width should be delimited'
  #       )
  #     elsif (pixels_height.positive? && pixels_width.positive?) && (mm_height.positive? && mm_width.positive?)
  #       errors.add(
  #         :pixels_height, :pixels_width, :mm_height, :mm_width,
  #         'pixels OR milimeters height/width should be delimited, not both of them'
  #       )
  #     else
  #       (pixels_height.positive? && pixels_width.positive?) || (mm_height.positive? && mm_width.positive?)
  #     end
  #   end
  # end



  #     if pixels_height.positive? && pixels_width.positive?
  #       (mm_height.nil? && mm.width.nil?) || (mm_height.zero? && mm.width.zero?)
  #     elsif mm_height.positive? && mm_width.positive?
  #       (pixels_height.nil? && pixels.width.nil?) || (pixels_height.zero? && pixels.width.zero?)
  #     else
  #       errors.add(
  #         :pixzels_height, :pixels_width, :mm_height, :mm_width,
  #         'pixels or milimeters height and width should be delimited'
  #       )
  #     end
  #   else
  #     pixels_height.nil? && pixels_width.nil? && mm_height.nil? && mm_width.nil?
  #   end
  # end

  # def check_presence_of_pixels_or_milimeters
  #   if product_format == 'digital' || product_format == 'printed'
  #     if pixels_height.positive?
  #       pixels_width.positive?
  #       mm_height.nil? || mm_height.zero?
  #       mm_width.nil? || mm_width.zero?
  #     elsif mm_height.positive?
  #       mm_width.positive?
  #       pixels_height.nil? || pixels_height.zero?
  #       pixels_width.nil? || pixels_width.zero?
  #     else
  #       errors.add(
  #         :pixels_height, :pixels_width, :mm_height, :mm_width,
  #         'pixels or milimeters height and width should be delimited'
  #       )
  #     end
  #   else
  #     pixels_height.nil? && pixels_width.nil? && mm_height.nil? && mm_width.nil?
  #   end
  # end


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
end

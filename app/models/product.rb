class Product < ApplicationRecord
  belongs_to :event

  validates :name, :product_format, :category, presence: true
  validates :name, length: { maximum: 50, too_long: '%(count) characters is the maximum allowed.' }
  validates :description, length: { minimum: 50, too_short: '%(count) is too short (minimum is 50 characters).' }
  validates :product_format,
            inclusion: { in: %w[digital printed audio video], message: '%(value) is not a valid format.' }
  validates :category,
            inclusion: { in: %w[flyer poster sticker backdrop audio video],
                         message: '%(value) is not a valid category.' }
  validates :required_time, numericality: { only_integer: true, greater_than: 0, message: 'should be greater than 0.' }

  validate :check_milliseconds_length, :check_pixels_or_milimeters

  def check_milliseconds_length
    return unless product_format == 'audio' || product_format == 'video'
    return if !milliseconds_length.nil? && milliseconds_length.positive?

    errors.add(
      :milliseconds_length,
      'must exist and be greater than zero.'
    )
  end

  def check_pixels_or_milimeters
    return unless product_format == 'printed' || product_format == 'digital'

    if pixels_height || pixels_width || mm_height || mm_width
      handle_specific_errors
    else
      handle_non_errors
    end
  end

  def handle_non_errors
    presence_of_pixels = pixels_height.present? && pixels_width.present?
    presence_of_mm = mm_height.present? && mm_width.present?

    return if presence_of_pixels && !presence_of_mm
    return if presence_of_mm && !presence_of_pixels

    handle_dimensions_errors
  end

  def handle_dimensions_errors
    %i[pixels_height pixels_width mm_height mm_width].each do |attr|
      errors.add(
        attr,
        'must have or milimeters or pixels dimension.'
      )
    end
  end

  def handle_specific_errors
    handle_pixels_height_errors
    handle_pixels_width_errors
    handle_mm_height_errors
    handle_mm_width_errors
  end

  def handle_pixels_height_errors
    return unless pixels_height.present? && pixels_height.positive? && (pixels_width.nil? || pixels_width.zero?)

    errors.add(
      :pixels_width,
      'must have a positive pixel width value.'
    )
  end

  def handle_pixels_width_errors
    return unless pixels_width.present? && pixels_width.positive? && (pixels_height.nil? || pixels_height.zero?)

    errors.add(
      :pixels_height,
      'must have a positive pixel height value.'
    )
  end

  def handle_mm_height_errors
    return unless mm_height.present? && mm_height.positive? && (mm_width.nil? || mm_width.zero?)

    errors.add(
      :mm_width,
      'must have a positive millimeter width value.'
    )
  end

  def handle_mm_width_errors
    return unless mm_width.present? && mm_width.positive? && (mm_height.nil? || mm_height.zero?)

    errors.add(
      :mm_height,
      'must have a positive millimeter height value.'
    )
  end
end

class Phone < ApplicationRecord
  belongs_to :phonable, polymorphic: true

  validates :number, :country_code, presence: true

  validate :check_number

  private

  def check_number
    regex = /^\(?0?[1-9]{2}\)?\s?([0-9]{4,5})([0-9]{4})$/
    return if number.nil? || number.strip =~ regex

    errors.add(
      :number,
      'should contain a valid phone number.'
    )
  end

  def check_country_code
    regex =
    return if country_code.nil? || country_code.strip =~ regex

    errors.add(
      :country_code,
      'should contain a valid country code.'
    )
  end
end

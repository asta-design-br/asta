class Event < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :addresses, as: :asta_addressable
  has_many :phones, as: :phonable
  has_many_attached :visual_references

  # validates_associated :user

  validates :title, :description, :start_time, :end_time, presence: true
  # rubocop:disable Style/StringLiterals, Style/FormatStringToken
  validates :title, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
  validates :description, length: { minimum: 50, too_short: "is too short (minimum is %{count} characters)" }
  # rubocop:enable Style/StringLiterals, Style/FormatStringToken
  validate :start_time_cannot_be_in_the_past, :end_time_cannot_be_before_start_time

  private

  def start_time_cannot_be_in_the_past
    return unless start_time.present? && start_time < DateTime.now

    errors.add(:start_time, 'can\'t be in the past')
  end

  def end_time_cannot_be_before_start_time
    return unless end_time.present? && end_time < start_time

    errors.add(:end_time, 'can\'t be before start time')
  end
end

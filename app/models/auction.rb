class Auction < ApplicationRecord
  belongs_to :product
  has_many :bids, dependent: :destroy

  validates :deadline, :product, presence: true
  validate :deadline_custom_validate

  private

  def deadline_custom_validate
    return if product.nil? || deadline.nil?

    is_before_event_start = deadline < product.event.start_time
    is_after_now = deadline > DateTime.now

    return if (is_after_now && is_before_event_start)

    errors.add(:deadline, 'must be after now and before event start time')
  end
end

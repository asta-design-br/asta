class Auction < ApplicationRecord
  belongs_to :product
  has_many :bids, dependent: :destroy
  validates :deadline, :product, presence: true
  validate :deadline_after_now_before_start_time

  private

  def deadline_after_now_before_start_time
    return if deadline.present? && product.present? && deadline > DateTime.now && deadline < product.event.start_time

    errors.add(:deadline, 'must be after now and before event start time')
  end
end

class Auction < ApplicationRecord
  belongs_to :product
  has_many :bids
  validate :deadline_after_now_before_start_time

  private

  def deadline_after_now_before_start_time
    return unless deadline > DateTime.now && deadline < start_time

    errors.add(:deadline, 'must be after now and before start time')
  end
end

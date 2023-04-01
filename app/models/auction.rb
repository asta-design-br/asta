class Auction < ApplicationRecord
    belongs_to :product
    has_many :bids, dependent: :destroy
    validates :deadline, :product, presence: true
    validate :deadline_after_now_before_start_time
  
    private
  
    def deadline_after_now_before_start_time
        is_before_event_start = deadline < product.event.start_time && product.present?
        is_after_now = deadline > DateTime.now
        
        return if deadline.present? && is_after_now && is_before_event_start
  
        errors.add(:deadline, 'must be after now and before event start time')
    end
  end
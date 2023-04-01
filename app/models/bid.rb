class Bid < ApplicationRecord
    belongs_to :user
    belongs_to :auction

    has_many :steps, dependent: :destroy

    validates :user, :auction, presence: :true
  end
class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction
  has_many :steps, dependent: :destroy

  validates :user, :auction, presence: true
  validate :roles_validation

  private

  def roles_validation
    return if user.nil? || user.roles.empty? || user.roles.map(&:name).include?('designer')

    errors.add(:user, 'must be a talent')
  end
end

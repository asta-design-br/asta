class Role < ApplicationRecord
  has_many :users
  validates :role_name, inclusion: { in: ['designer', 'promoter'], message: "%<value>s is not a valid role" }
end

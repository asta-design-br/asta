class Role < ApplicationRecord
  validates :name, inclusion: { in: ['designer', 'promoter'], message: "%<value>s is not a valid role" }
end

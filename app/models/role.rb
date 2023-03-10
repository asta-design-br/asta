class Role < ApplicationRecord
  validates :name, inclusion: { in: ['designer', 'producer'], message: "%<value>s is not a valid role" }
end

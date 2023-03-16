class Role < ApplicationRecord
  validates :name, inclusion: { in: ['designer', 'producer'], message: "%<value> is not a valid role." }
end

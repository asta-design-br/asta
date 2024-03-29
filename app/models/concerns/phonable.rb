module Phonable
  extend ActiveSupport::Concern

  def self.included(base = nil, &)
    @included_in ||= []
    @included_in << base.name if base
    super
  end

  def self.included_in
    @included_in
  end

  included do
    has_many :phones, as: :phonable, dependent: :destroy
  end
end

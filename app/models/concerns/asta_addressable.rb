module AstaAddressable
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
    has_many :addresses, as: :asta_addressable, dependent: :destroy
  end
end

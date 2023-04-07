require 'spec_helper'

shared_examples_for 'asta_addressable' do
  let(:model) { described_class }

  it 'has many phones association' do
    asta_addressable = FactoryBot.build(model.to_s.underscore.to_sym)
    expect { asta_addressable.addresses }.to_not raise_error(NoMethodError)
    expect(asta_addressable.addresses).to be_an(ActiveRecord::Relation)
    # expect(asta_addressable.addresses.first).to be_a(Address)
  end
end

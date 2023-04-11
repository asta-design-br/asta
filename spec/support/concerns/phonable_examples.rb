require 'spec_helper'

shared_examples_for 'phonable' do
  let(:model) { described_class }

  it 'has many phones association' do
    phonable = FactoryBot.build(model.to_s.underscore.to_sym)
    expect { phonable.phones }.to_not raise_error(NoMethodError)
    expect(phonable.phones).to be_an(ActiveRecord::Relation)
    # expect(phonable.phones.first).to be_a(Phone)
  end
end

require 'rails_helper'
require Rails.root.join 'spec/support/concerns/phonable_examples.rb'

RSpec.describe User, type: :model do
  context 'concerns' do
    it_behaves_like 'phonable'
  end
end

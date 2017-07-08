require 'rails_helper'

RSpec.describe User, type: :model do
	describe User, 'associations' do
    it { should have_many(:reviews) }
  end
end

require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe Movie, 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:studio) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:genre) }
  end

  describe Movie, 'associations' do
    it { should have_many(:reviews) }
  end
end

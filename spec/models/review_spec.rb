require 'rails_helper'

RSpec.describe Review, type: :model do
   
  describe Review, 'validations' do
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:rating) }
  end

  describe Review, 'associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:user) }
  end
end

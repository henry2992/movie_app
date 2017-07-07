require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:studio) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:price) }]
  it { should validate_presence_of(:genre) }
end

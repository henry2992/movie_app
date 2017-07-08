require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @movie = FactoryGirl.create(:movie)
  end

  describe "Post #create" do
    it "creates a new comment for movie" do
      expect {
        post :create, 
          params: { 
            movie_id: @movie.id,
            review: {
              comment: 'Comment for Movie',
              rating: 8,
              user_id: @user.id,
            } 
          }
        }.to change(Review, :count).by(1)
    end
  end
end
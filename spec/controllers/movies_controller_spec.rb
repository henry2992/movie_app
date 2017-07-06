require 'rails_helper'

RSpec.describe MoviesController, type: :controller do


  describe "GET #index" do
    before do
      sign_in user
    end

    byebug
    it "returns a success response" do
      movie = Movie.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  # describe "GET #show" do
  #   it "returns a success response" do
  #     movie = Movie.create! valid_attributes
  #     get :show, params: {id: movie.to_param}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns a success response" do
  #     movie = Movie.create! valid_attributes
  #     get :edit, params: {id: movie.to_param}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Movie" do
  #       expect {
  #         post :create, params: {movie: valid_attributes}, session: valid_session
  #       }.to change(Movie, :count).by(1)
  #     end

  #     it "redirects to the created movie" do
  #       post :create, params: {movie: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(Movie.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: {movie: invalid_attributes}, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested movie" do
  #       movie = Movie.create! valid_attributes
  #       put :update, params: {id: movie.to_param, movie: new_attributes}, session: valid_session
  #       movie.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the movie" do
  #       movie = Movie.create! valid_attributes
  #       put :update, params: {id: movie.to_param, movie: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(movie)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       movie = Movie.create! valid_attributes
  #       put :update, params: {id: movie.to_param, movie: invalid_attributes}, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested movie" do
  #     movie = Movie.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: movie.to_param}, session: valid_session
  #     }.to change(Movie, :count).by(-1)
  #   end

  #   it "redirects to the movies list" do
  #     movie = Movie.create! valid_attributes
  #     delete :destroy, params: {id: movie.to_param}, session: valid_session
  #     expect(response).to redirect_to(movies_url)
  #   end
  # end

end
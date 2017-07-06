require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  before do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end

    it "assigns @movies" do
      movie1 = FactoryGirl.create(:movie)
      movie2 = FactoryGirl.create(:movie)
      get :index
      expect(assigns(:movies)).to eq([movie1, movie2])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      movie = FactoryGirl.create(:movie)
      get :show, params: {id: movie.id}
      expect(response).to be_success
    end
    it "assigns the new movie to @movie" do
      movie = FactoryGirl.create(:movie)
      get :show, params: {id: movie.id}
      expect(assigns(:movie)).to eq(movie)
    end
    it "renders the show view" do
      movie = FactoryGirl.create(:movie)
      get :show, params: {id: movie.id}
      expect(response).to render_template :show
    end
  end

  describe "POST #create" do
    
    context "with valid attributes" do
      it "creates a new Movie" do
        expect {
           post :create, params: 
            { 
              movie: {
                title: 'Advanced Classical Music',
              },
            }
        }.to change(Movie, :count).by(1)
      end
    end
      

      # it "redirects to the created movie" do
      #   post :create, params: {movie: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(Movie.last)
      # end
    # end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'new' template)" do
    #     post :create, params: {movie: invalid_attributes}, session: valid_session
    #     expect(response).to be_success
    #   end
    # end
  end

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

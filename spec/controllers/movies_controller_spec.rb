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

      let(:valid_attributes) {
        { 
          title: 'New Title',
          studio: "Lucas Film",
          date: Date.today,
          price: 11.50,
          rating: 10,
          genre: "Action",
        }
      }

      it "creates a new Movie" do
        expect {
           post :create, params: { movie: valid_attributes }
        }.to change(Movie, :count).by(1)
      end

      it "redirects to the created movie" do
        post :create, params: { movie: valid_attributes }
        expect(response).to redirect_to(Movie.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { 
          title: 'New Title'
        }
      }

      it "updates the requested movie" do
        movie = FactoryGirl.create(:movie)
        put :update, params: {id: movie.id, movie: new_attributes}
        movie.reload
        expect(movie.title).to eq('New Title')
      end

      it "redirects to the movie" do
        movie = FactoryGirl.create(:movie)
        put :update, params: {id: movie.id, movie: new_attributes}
        expect(response).to redirect_to(movie)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested movie" do
      movie = FactoryGirl.create(:movie)
      expect {
        delete :destroy, params: {id: movie.id}
      }.to change(Movie, :count).by(-1)
    end

    it "redirects to the movies list" do
      movie = FactoryGirl.create(:movie)
      delete :destroy, params: {id: movie.id}
      expect(response).to redirect_to(movies_url)
    end
  end

end

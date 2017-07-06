require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :title => "MyString",
      :studio => "MyString",
      :date => "",
      :price => 1.5,
      :rating => 1.5,
      :genre => "MyString"
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[studio]"

      assert_select "input[name=?]", "movie[date]"

      assert_select "input[name=?]", "movie[price]"

      assert_select "input[name=?]", "movie[rating]"

      assert_select "input[name=?]", "movie[genre]"
    end
  end
end

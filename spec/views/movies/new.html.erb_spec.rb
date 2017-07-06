require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :title => "MyString",
      :studio => "MyString",
      :date => "",
      :price => 1.5,
      :rating => 1.5,
      :genre => "MyString"
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[studio]"

      assert_select "input[name=?]", "movie[date]"

      assert_select "input[name=?]", "movie[price]"

      assert_select "input[name=?]", "movie[rating]"

      assert_select "input[name=?]", "movie[genre]"
    end
  end
end

require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        :title => "Title",
        :studio => "Studio",
        :date => "",
        :price => 2.5,
        :rating => 3.5,
        :genre => "Genre"
      ),
      Movie.create!(
        :title => "Title",
        :studio => "Studio",
        :date => "",
        :price => 2.5,
        :rating => 3.5,
        :genre => "Genre"
      )
    ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Studio".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
  end
end

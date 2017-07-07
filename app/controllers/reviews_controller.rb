class ReviewsController < ApplicationController

  before_action :set_movie, only: [:create]

  def create
    comment = @movie.reviews.build(review_params)
    if @movie.save
      redirect_to @movie, notice: 'Movie Review was successfully created.'
    else
      redirect_to @movie, notice: comment.errors.full_messages
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end

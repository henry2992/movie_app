class ReviewsController < ApplicationController

  before_action :set_movie, only: [:create, :related_comments]

  def create
    review = @movie.reviews.build(review_params)
    review.user_id = current_user.id
    if @movie.save
      redirect_to @movie, notice: 'Movie Review was successfully created.'
    else
      redirect_to @movie, notice: review.errors.full_messages
    end
  end

  def related_comments
    related_review = Review.create!(comment: review_comment[:comment], rating: 0.1, user_id: current_user.id)
    review = Review.find(params[:review_id])
    review.related_review << related_review
    if review.save
      redirect_to @movie, notice: 'Review comment was successfully created.'
    else
      redirect_to @movie, notice: review.errors.full_messages
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:comment, :rating, :user_id)
  end

  def review_comment
    params.require(:review_comment).permit(:comment)
  end

end

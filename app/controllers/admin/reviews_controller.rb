class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'tag'
      @reviews = Tag.search_reviews_for(@content, @method)
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to admin_campsite_review_path(review.campsite_id,review.id)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_campsite_path(review.campsite_id)
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :comment, :review_image)
  end


end

class Public::ReviewsController < ApplicationController
  before_action :authenticate_member!

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    @review.campsite_id = params[:campsite_id]
    if @review.save
      @tagmap = Tagmap.new(tagmap_params)
      @tagmap.review_id = @review.id
      @tagmap.save
      redirect_to campsite_review_path(@review.campsite_id,@review.id)
    else
      redirect_to campsite_review_path(@review.campsite_id,@review.id)
    end
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to campsite_path(@campsite)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to campsite_path(@campsite)
  end

  private

  def review_params
    params.require(:review).permit(:title, :evaluation, :comment,:review_image)
  end

  def tagmap_params
    params.require(:review).permit(:tag_id)
  end

end

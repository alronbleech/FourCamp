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
      redirect_to campsite_review_path(@review.campsite_id,@review.id)
    else
      render :new
    end
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to review_path(@review)
  end

  private

  def review_params
    params.require(:review).permit(:title, {tag_ids: []}, :evaluation, :comment,:review_image)
  end

end

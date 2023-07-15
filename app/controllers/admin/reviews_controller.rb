class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @review = Review.find_by(id: params[:id])
    if @review.present?
    else
      redirect_to admin_path
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
    if @review.present?
    else
      redirect_to admin_path
    end
  end

  def update
    @review = Review.find(params[:id])
    tag_list = params[:review][:tag_name].split(',')
    if @review.update(review_params)
      @review.save_tags(tag_list)
      redirect_to admin_campsite_review_path(@review.campsite_id)
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_campsite_path(review.campsite_id)
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :comment, :season_id, :review_image)
  end
end

class Public::ReviewsController < ApplicationController
  before_action :authenticate_member!

  def new
    @review = Review.new
  end

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

  def create
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    @review.campsite_id = params[:campsite_id]
    tag_list = params[:review][:tag_name].split(',')
    if @review.save
      @review.save_tags(tag_list)
      redirect_to campsite_path(@review.campsite_id)
    else
      redirect_to about_path
    end
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to campsite_review_path(review.campsite_id,review.id)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to campsite_path(review.campsite_id)
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :comment, :review_image) #tagmaps_attributes: [:tag_id])
  end

end

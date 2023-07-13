class Public::ReviewsController < ApplicationController
  before_action :authenticate_member!

  def create
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    @review.campsite_id = params[:campsite_id]
    tags = if params[:review][:review_image].present?
       Vision.get_image_data(review_params[:review_image])
     else
       []
    end
    if params[:review][:tag_name] == ""
      flash[:notice] = "タグが入力されていません。"
      @campsite = Campsite.find(params[:campsite_id])
      @tags = Tag.all
      @seasons = Season.all
      @review = Review.new

      @content = params[:content]
      @method = params[:method]
      @season_id = params[:season_id]

      @reviews = Review.where(campsite_id: @campsite.reviews).page(params[:page]).per(5)

      redirect_to campsite_path(@campsite)

    elsif @review.save
      tags.each do |tag|
        @review.tags.create(name: tag)
      end
      tag_list = (params[:review][:tag_name].split(',') << tags).flatten!
      @review.save_tags(tag_list)
      redirect_to campsite_path(@review.campsite_id)
    else
      @campsite = Campsite.find(params[:campsite_id])
      @tags = Tag.all
      @seasons = Season.all

      @content = params[:content]
      @method = params[:method]
      @season_id = params[:season_id]

      @reviews = Review.where(campsite_id: @campsite.reviews).page(params[:page]).per(5)
      flash[:error] = @review.errors.full_messages
      redirect_to campsite_path(@campsite)
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to campsite_path(review.campsite_id)
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :comment, :season_id, :review_image)
  end

end

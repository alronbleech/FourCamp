class Public::ReviewsController < ApplicationController
  before_action :authenticate_member!

  def new
    @review = Review.new
  end

  def index
    @content = params[:content]
    @method = params[:method]
    @season_id = params[:season_id]

    @reviews = Review.where(campsite_id: params[:campsite_id])

    if @season_id.present?
      @reviews = @reviews.where(season_id: @season_id)
    end
    
    if @content.present?
      tag_review_ids = Tag.search_reviews_for(@content, @method)
      review_ids = @reviews.pluck(:id) & tag_review_ids # [1,2,3] & [3,4,5] => [3]
      @reviews = Review.where(id: review_ids)
    end

    @reviews = @reviews.page(params[:page]).per(5)
  end

  def show
   @review = Review.find_by(id: params[:id])
    if @review.present?
    else
      redirect_to campsites_path
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
    if @review.present?
    else
      redirect_to campsites_path
    end
  end

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
      flash[:notice] = "季節が入力されていません。"
      render :new
    elsif @review.save
      tags.each do |tag|
        @review.tags.create(name: tag)
      end
      tag_list = (params[:review][:tag_name].split(',') << tags).flatten!
      @review.save_tags(tag_list)
      redirect_to campsite_path(@review.campsite_id)
    else
      render :new
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.member_id = current_member.id
    @review.campsite_id = params[:campsite_id]
    if params[:review][:tag_name] == ""
      flash[:notice] = "タグが入力されていません。"
      render :edit
    elsif @review.save
      tag_list = params[:review][:tag_name].split(',')
      @review.save_tags(tag_list)
      redirect_to campsite_review_path(@review.campsite_id)
    else
      render :edit
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

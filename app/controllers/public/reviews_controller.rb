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
      @reviews = Kaminari.paginate_array(@reviews).page(params[:page]).per(5)
    end
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
    if params[:review][:tag_name] == ""
      flash[:notice] = "季節が入力されていません。"
      render :new
    elsif @review.save
      tag_list = params[:review][:tag_name].split(',')
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
    p params[:review][:tag_name]
    if params[:review][:tag_name] == ""
      flash[:notice] = "季節が入力されていません。"
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
    params.require(:review).permit(:title, :star, :comment, :review_image)
  end

end

class Public::CampsitesController < ApplicationController

  def index
    @prefectures = Prefecture.all
    @campsite_types = CampsiteType.all
    if params[:prefecture_id].present? && params[:campsite_type_id].present?
      @campsites = Campsite.where(prefecture_id: params[:prefecture_id], campsite_type_id: params[:campsite_type_id]).page(params[:page]).per(5)
      respond_to do |format|
        format.html
        format.js
      end
    elsif params[:prefecture_id].present?
      @campsites = Campsite.where(prefecture_id: params[:prefecture_id]).page(params[:page]).per(5)
      respond_to do |format|
        format.html
        format.js
      end
    elsif params[:campsite_type_id].present?
      @campsites = Campsite.where(prefecture_id: params[:campsite_type_id]).page(params[:page]).per(5)
      respond_to do |format|
        format.html
        format.js
      end
    else
      @campsites = Campsite.page(params[:page]).per(5)
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def show
    @campsite = Campsite.find(params[:id])
    @tags = Tag.all
    @seasons = Season.all

    @content = params[:content]
    @method = params[:method]
    @season_id = params[:season_id]

    @reviews = Review.where(campsite_id: @campsite.reviews)

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

end

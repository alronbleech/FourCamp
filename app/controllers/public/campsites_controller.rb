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
    @reviews = @campsite.reviews
    @tags = Tag.all
    @seasons = Season.all
  end

end

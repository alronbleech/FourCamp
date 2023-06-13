class Public::CampsitesController < ApplicationController
  
  def index
    @prefectures = Prefecture.all
    @campsite_types = CampsiteType.all
    @campsites = Campsite.where(prefecture_id: params[:prefecture_id], campsite_type_id: params[:campsite_type_id])
  end

  def show
    @campsite = Campsite.find(params[:id])
  end
  
end

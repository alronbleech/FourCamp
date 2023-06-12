class Admin::CampsitesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @campsite = Campsite.new
  end

  def index
    @prefectures = Prefecture.all
    @campsite_types = CampsiteType.all
    @campsites = Campsite.where(prefecture_id: params[:prefecture_id], campsite_type_id: params[:campsite_type_id])
  end

  def show
    @campsite = Campsite.find(params[:id])
  end

  def edit
    @campsite = Campsite.find(params[:id])
  end

  def create
    @campsite = Campsite.new(campsite_params)
    if @campsite.save
      redirect_to admin_campsites_path(@campsite.id)
    else
      render :new
    end
  end

  def update
    campsite = Campsite.find(params[:id])
    campsite.update(campsite_params)
    redirect_to admin_campsite_path(campsite)
  end

  def destroy
    campsite = Campsite.find(params[:id])
    campsite.destroy
    redirect_to admin_campsites_path
  end

  private

  def campsite_params
    params.require(:campsite).permit(:campsite_type_id,:prefecture_id,:name,:address,:phone_number,:route,:feature,:considerations,:campsite_image,:prefecture_name,:type_name)
  end

end

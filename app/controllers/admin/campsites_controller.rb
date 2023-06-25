class Admin::CampsitesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @campsite = Campsite.new
  end

  def index
    @prefectures = Prefecture.all
    @campsite_types = CampsiteType.all
    if params[:prefecture_id].present?
      @campsites = Campsite.where(prefecture_id: params[:prefecture_id], campsite_type_id: params[:campsite_type_id]).page(params[:page]).per(5)
      respond_to do |format|
        format.html
        format.js
      end
    else
      @campsites = Campsite.page(params[:page]).per(5)
    end
  end

  def show
    @campsite = Campsite.find_by(id: params[:id])
    if @campsite.present?
    else
      redirect_to admin_path
    end
  end

  def edit
    @campsite = Campsite.find_by(id: params[:id])
    if @campsite.present?
    else
      redirect_to admin_path
    end
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
    @campsite = Campsite.find(params[:id])
    if @campsite.update(campsite_params)
      redirect_to admin_campsite_path(@campsite)
    else
      render :edit
    end
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

class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:is_deleted].present?
      @members = Member.where(is_deleted: params[:is_deleted])
    else
      @members = Member.all
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path(@member)
    else
      render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :name_ruby, :nickname, :email, :is_deleted, :profile_image)
  end

end

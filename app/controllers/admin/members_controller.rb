class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(contact_params)
    redirect_to admin_member_path(@member)
  end

  private

  def contact_params
    params.require(:member).permit(:name, :nem_ruby, :nickname, :email, :profile_image)
  end

end

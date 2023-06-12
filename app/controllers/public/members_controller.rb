class Public::MembersController < ApplicationController
  before_action :authenticate_member!

  def show
    is_matching_login_member
    @member = Member.find(params[:id])
    @review = @member.reviews
  end

  def edit
    is_matching_login_member
    @member = Member.find(params[:id])
  end

  def update
    is_matching_login_member
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(current_member)
    else
      render :edit
    end
  end

  def quit
  end


  private
  def member_params
    params.require(:member).permit(:email,:name,:name_ruby,:nickname,:is_deleted)
  end

  def is_matching_login_member
    member = Member.find(params[:id])
    unless member.id == current_member.id
    redirect_to root_path
    end
  end
end

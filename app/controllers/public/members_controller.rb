class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_guest_member, only: [:edit]

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
      redirect_to member_path(@member)
    else
      render :edit
    end
  end

  def quit
  end

  def out
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
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

  def ensure_guest_member
    @member = Member.find(params[:id])
    if @member.name == "guest"
      redirect_to root_path
    end
  end

end

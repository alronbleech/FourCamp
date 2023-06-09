# frozen_string_literal: true

class Public::Members::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_member, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end
  def after_sign_in_path_for(resource)
    root_path
  end
  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to root_path
  end
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def reject_member
    @member = Member.find_by(name: params[:member][:name])
    if @user
      if @user.valid_password?(params[:member][:password]) && (@member.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_member_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

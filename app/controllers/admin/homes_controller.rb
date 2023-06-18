class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    if params[:supported_status].present?
      @contacts = Contact.where(supported_status: params[:supported_status])
    else
      @contacts = Contact.all
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:supported_status)
  end

end

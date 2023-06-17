class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @contacts = Contact.all
    #@contacts = Contact.where(supported_status:unsupported)
  end

  private

  def contact_params
    params.require(:contact).permit(:supported_status)
  end

end

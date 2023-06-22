class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def show

  end

  def create
    @contact = Contact.new(contact_params)
    @contact.member_id = current_member.id
    if @contact.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :demand, :supported_status)
  end

end

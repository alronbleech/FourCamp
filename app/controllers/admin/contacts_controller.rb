class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
end

class Public::SearchesController < ApplicationController
  before_action :authenticate_member!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'tag'
      @model == Tag.search_reviews_for(@content, @method)
    end
end

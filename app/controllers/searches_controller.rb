class SearchesController < ApplicationController

  def index
  end

  def show
    #debugger
    #this is a way of explicitly setting a break point
    search = SimpleTwitter::Search.new
    flash.notice = "I just did your search."
    @results=search.search(params[:q])
  end
end




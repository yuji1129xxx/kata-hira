class AdminController < ApplicationController
  before_filter :auth
  
  def index
    if params[:command] == "delete_person" || params[:command] == "edit_person"
      @people = Person.all.order("created_at DESC").page(params[:page]).per(10)
    elsif params[:command] == "delete_resource" || params[:command] == "edit_resource"
      @resources = Resource.all.order("created_at DESC").page(params[:page]).per(10)
    end
  end

  private
  def auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == 'katahira' && pass == 'takeyama'
    end
  end
end

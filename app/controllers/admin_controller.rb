class AdminController < ApplicationController
  before_filter :auth
  
  def index
    @people = Person.recent.page(params[:page]).per(10) if delete_or_edit_person?
    @resources = Resource.recent.page(params[:page]).per(10) if delete_or_edit_resource?
  end

  private
  def auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == 'katahira' && pass == 'takeyama'
    end
  end

  def delete_or_edit_person?
    params[:command] == "delete_person" || params[:command] == "edit_person"
  end

  def delete_or_edit_resource?
    params[:command] == "delete_resource" || params[:command] == "edit_resource"
  end
end

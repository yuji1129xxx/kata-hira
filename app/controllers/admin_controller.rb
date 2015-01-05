class AdminController < ApplicationController
  before_filter :auth
  
  def index
  end

  private
  def auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == 'user' && pass == 'pass'
    end
  end
end

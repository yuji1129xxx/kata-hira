class UsersController < ApplicationController
  def show
    @events = current_user.events.order("created_at DESC").page(params[:page]).per(10)
  end
end

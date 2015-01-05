class CommentsController < ApplicationController
  def create
    Comment.create(create_params)
    event = Event.find(create_params[:event_id])
    redirect_to event_path(event)
  end

  private
  def create_params
    params.permit(:text, :event_id)
  end
end

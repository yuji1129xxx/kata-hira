class EventsController < ApplicationController
  def index
    @events = Event.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    if user_signed_in?
      @people = Person.all.order("created_at DESC").page(params[:page]).per(10)
      @resources = Resource.all.order("created_at DESC").page(params[:page]).per(10)
      @person = Person.find(new_params[:person_id]) if new_params[:person_id]
      @resource = Resource.find(new_params[:resource_id]) if new_params[:resource_id]
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if create_params[:kata].present? && create_params[:hira].present? && create_params[:text].present?
      Event.create(name: "#{create_params[:kata]}風#{create_params[:hira]}", detail: create_params[:text], person_id: create_params[:person_id], resource_id: create_params[:resource_id], user_id: current_user.id)
    else
      redirect_to "/events/new?person_id=#{create_params[:person_id]}&resource_id=#{create_params[:resource_id]}"
    end
  end

  def show
    @event = Event.find(id_params[:id])
    @comments = @event.comments.order("created_at DESC").page(params[:page]).per(10)
  end

  def info
  end

  private
  def new_params
    params.permit(:person_id, :resource_id)
  end

  def create_params
    params.permit(:kata, :hira, :text, :person_id, :resource_id)
  end

  def id_params
    params.permit(:id)
  end
end

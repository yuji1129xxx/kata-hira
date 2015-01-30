class EventsController < ApplicationController
  before_action :redirect_to_sign_up, only: :new

  def index
    @events = Event.recent.page(params[:page]).per(10)
  end

  def new
    @people = Person.recent.page(params[:page]).per(10)
    @resources = Resource.recent.page(params[:page]).per(10)
    @person = Person.find(new_params[:person_id]) if new_params[:person_id]
    @resource = Resource.find(new_params[:resource_id]) if new_params[:resource_id]
  end

  def create
    if params_complete?
      Event.create(create_params)
    else
      redirect_to new_event_path(person_id: create_params[:person_id], resource_id: create_params[:resource_id])
    end
  end

  def show
    @event = Event.find(id_params[:id])
    @comments = @event.comments.page(params[:page]).per(10)
  end

  def edit
    @event = Event.find(id_params[:id])
  end

  def update
    event = Event.find(id_params[:id])
    event.update(update_params)
  end

  def destroy
    event = Event.find_by(id_params)
    event.destroy if event.user_id == current_user.id
  end

  def info
  end

  private
  def new_params
    params.permit(:person_id, :resource_id)
  end

  def create_params
    params.permit(:detail, :person_id, :resource_id).merge(user_id: current_user.id, name: event_name)
  end

  def name_params
    params.permit(:kata, :hira)
  end

  def id_params
    params.permit(:id)
  end

  def update_params
    params.permit(:name, :detail)
  end

  def params_complete?
    name_params[:kata].present? && name_params[:hira].present? && create_params[:detail].present?
  end

  def event_name
    "#{name_params[:kata]}風#{name_params[:hira]}"
  end

  def redirect_to_sign_up
    redirect_to new_user_session_path unless user_signed_in?
  end
end

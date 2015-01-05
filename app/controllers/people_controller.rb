class PeopleController < ApplicationController
  def index
    @people = Person.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @person = Person.find(id_params[:id])
  end

  def create
    person = Person.create(create_params)
    if person.persisted?
      keywords_params.each_value do |keyword|
        PersonKeyword.create(name: keyword, material_id: person.id) if keyword.present?
      end
      redirect_to "/admin"
    else
      redirect_to "/admin?command=add_person"
    end
  end

  private
  def id_params
    params.permit(:id)
  end

  def create_params
    params.permit(:name, :detail, :avatar)
  end

  def keywords_params
    params.permit(:keyword1, :keyword2, :keyword3, :keyword4)
  end
end

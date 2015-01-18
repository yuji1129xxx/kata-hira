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

  def edit
    @person = Person.find(id_params[:id])
  end

  def update
    person = Person.find(id_params[:id])
    person.update(create_params)
    if person.persisted?
      keywords_params.each_value do |keyword|
        PersonKeyword.create(name: keyword, material_id: person.id) if keyword.present?
      end
      redirect_to "/admin?command=edit_person"
    else
      redirect_to "/admin"
    end
  end

  def destroy
    Person.find(id_params[:id]).destroy
    redirect_to "/admin?command=delete_person"
  end

  def delete_keywords
    Person.find(id_params[:id]).keywords.each do |keyword|
      keyword.destroy
    end
    redirect_to "/admin?command=edit_person"
  end

  private
  def id_params
    params.permit(:id)
  end

  def create_params
    params.permit(:name, :detail, :avatar)
  end

  def keywords_params
    params.permit(:keyword1, :keyword2, :keyword3, :keyword4, :keyword5, :keyword6, :keyword7, :keyword8)
  end
end

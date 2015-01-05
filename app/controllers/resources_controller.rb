class ResourcesController < ApplicationController
  def index
    @resources = Resource.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @resource = Resource.find(id_params[:id])
  end

  def create
    resource = Resource.create(create_params)
    if resource.persisted?
      keywords_params.each_value do |keyword|
        ResourceKeyword.create(name: keyword, material_id: resource.id) if keyword.present?
      end
      redirect_to "/admin"
    else
      redirect_to "/admin?command=add_resource"
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

class ResourcesController < ApplicationController
  def index
    @resources = Resource.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @resource = Resource.find(id_params[:id])
  end

  def create
    resource = Resource.create(resource_params)
    if resource.persisted?
      keywords_params.each_value do |keyword|
        ResourceKeyword.create(name: keyword, material_id: resource.id) if keyword.present?
      end
      redirect_to "/admin"
    else
      redirect_to "/admin?command=add_resource"
    end
  end

  def edit
    @resource = Resource.find(id_params[:id])
  end

  def update
    resource = Resource.find(id_params[:id])
    resource.update(resource_params)
    if resource.persisted?
      keywords_params.each_value do |keyword|
        ResourceKeyword.create(name: keyword, material_id: resource.id) if keyword.present?
      end
      redirect_to "/admin?command=edit_resource"
    else
      redirect_to "/admin"
    end
  end

  def destroy
    Resource.find(id_params[:id]).destroy
    redirect_to "/admin?command=delete_resource"
  end

  def delete_keywords
    Resource.find(id_params[:id]).keywords.each do |keyword|
      keyword.destroy
    end
    redirect_to "/admin?command=edit_resource"
  end

  private
  def id_params
    params.permit(:id)
  end

  def resource_params
    params.permit(:name, :detail, :avatar, :pfile)
  end

  def keywords_params
    params.permit(:keyword1, :keyword2, :keyword3, :keyword4, :keyword5, :keyword6, :keyword7, :keyword8)
  end
end

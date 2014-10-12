class CategoriesController < ApplicationController
  def index
    @categories = Category.order("id DESC").page(params[:page]).per(5)
    @title = 'Category manage'
  end

  def show
    @category = Category.find_by_id(params[:id])
    redirect_to not_found_path unless @category
  end
end

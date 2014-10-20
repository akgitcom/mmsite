class ProductsController < ApplicationController
  def index
    @products = Product.order("id DESC").page(params[:page]).per(5)
    @title = 'product manage'
  end
  def show
    @product = Product.find_by_id(params[:id])
  end
end

class ProductsController < ApplicationController
  def index
    @products = Product.order("pid DESC").page(params[:page]).per(5)
    @title = 'product manage'
  end
  def show
    @product = Product.find_by_pid(params[:id])
  end
end

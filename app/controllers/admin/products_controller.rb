class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @products = Product.order("pid DESC").page(params[:page]).per(5)
    @title = 'product manage'
  end
  def show
    @product = Product.find_by_pid(params[:id])
  end
end

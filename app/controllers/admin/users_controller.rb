class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!, :except => []
  def index
    @users = User.order("id DESC").page(params[:page]).per(1)
    @title = 'manager users'
  end
  def show
    @user = User.find(params[:id])
  end
end
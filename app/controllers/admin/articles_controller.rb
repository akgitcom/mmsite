class Admin::ArticlesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @articles = Article.order("aid DESC").page(params[:page]).per(5)
    @title = 'Article manage'
  end
  def show
    @article = Article.find_by_aid(params[:id])
  end
end

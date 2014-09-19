class ArticlesController < ApplicationController
  def index
    @articles = Article.order("aid DESC").page(params[:page]).per(5)
    @title = 'Article manage'
  end
  def show
    @article = Article.find_by_aid(params[:id])
  end
end

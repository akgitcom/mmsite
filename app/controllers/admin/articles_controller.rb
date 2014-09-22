class Admin::ArticlesController < Admin::ApplicationController
  before_filter :authenticate_user!
  def index
    @articles = Article.order("aid DESC").page(params[:page]).per(5)
    @title = 'Article manage'
  end
  def show
    @article = Article.find_by_aid(params[:id])
  end
  def edit
    @article = Article.find_by_aid(params[:id])
    @products = Product.all
    @relateproducts = @article.products
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to [:admin, @article]
    else
      render "edit"
    end
  end
  private
  def article_params
    params.require(:article).permit(:seotitle, :keywords, :description, :title, :shortcontent, :content, :sort, :sblock, product_ids:[])
  end
end

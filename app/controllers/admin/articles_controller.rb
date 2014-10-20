class Admin::ArticlesController < Admin::ApplicationController
  before_filter :authenticate_user!

  def index
    @articles = Article.order("aid DESC").page(params[:page]).per(5)
    @title = 'Article manage'
  end

  def new
    @article = Article.new
    @relateproducts = @article.products
  end

  def create
    article = Article.new(article_params)
    if article.save
      # if params[:images]
      #   params[:images].each { |image|
      #     @article.photos.create(image: image)
      #   }
      # end
      flash[:notice] = "Your product has been created."
      redirect_to [:admin, article]
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end
  def destroy
    article = Article.find_by(aid: params[:id])
    if article.destroy
      redirect_to [:admin, article]
    end
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
    article = Article.find(params[:id])
    if article.update(article_params)
      redirect_to [:admin, article]
    else
      render "edit"
    end
  end
  private
  def article_params
    params.require(:article).permit(
        :seotitle,
        :keywords,
        :description,
        :title,
        :img,
        :shortcontent,
        :content,
        :sort,
        :sblock,
        :remove_img,
        :searchkey,
        product_ids:[]
    )
  end
end

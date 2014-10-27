class Admin::CategoriesController < Admin::ApplicationController

  before_filter :authenticate_user!
  include CategoriesHelper
  helper_method :pinyin

  def index
    @categories = Category.order("id DESC").page(params[:page]).per(10)
    @title = 'Category manage'
    # Category.rebuild!
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)

    if category.save
      flash[:notice] = "Category has been created."
      redirect_to admin_categories_url
    end
  end

  def destroy
    category = Category.find_by(id: params[:id])
    if category.destroy
      redirect_to [:admin, category]
    end
  end

  def edit
    @category = Category.find_by_id(params[:id])
    @product = Product.all
  end

  def update
    @category = Category.find_by_id(params[:id])
    if @category.update(category_params)
      redirect_to [:admin, @category]
    else
      render "edit"
    end
  end

  def search
    @page_title = "Search"
    if params[:commit] == "Search" || params[:q]
      # @products = Product.find_with_ferret(params[:q].to_s.upcase)
      @categories = Category.where("title LIKE '%#{params[:q]}%'").order("id DESC").page(params[:page]).per(5)
      unless @categories.size > 0
        flash.now[:notice] = "Not found"
      end
    end
    render 'admin/categories/index'
  end

  def state
    category = Category.find(params[:id])
    if category.update_attributes!(sblock: params[:state])
      respond_to do |format|
        format.json { render :json => {'success'=>category.title}, :content_type => 'application/json'}
      end
    end
  end

  private
  def category_params
    params.require(:category).permit(
        :parent_id,
        :title,
        :keywords,
        :description,
        :content,
        :shortcontent,
        :img,
        :thumb,
        :sblock,
        :sort,
        :seotitle,
        :routename,
        :remove_img,
        :remove_thumb
    )
  end
end

class Admin::CategoriesController < Admin::ApplicationController

  before_filter :authenticate_user!
  include CategoriesHelper
  helper_method :pinyin

  def index
    @categories = Category.order("id DESC").page(params[:page]).per(5)
    @title = 'Category manage'
    Category.rebuild!
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
    puts "fuck==============================#{params[:parent_id]}"
    @category = Category.find_by_id(params[:id])
    if @category.update(category_params)
      redirect_to [:admin, @category]
    else
      render "edit"
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

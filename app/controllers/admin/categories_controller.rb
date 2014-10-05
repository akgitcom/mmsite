class Admin::CategoriesController < Admin::ApplicationController
  before_filter :authenticate_user!
  include CategoriesHelper
  helper_method :pinyin
  def index
    @categories = Category.order("cid DESC").page(params[:page]).per(5)
    @title = 'Category manage'

    @c = Category.all
    hash = {'a' => {1 => 10, 2 => 20}, 'b' => {3 => 30, 4 => 40}}
    hash.each { |key1, hash1|
      print "hash #{key1} has keys:", hash1.keys.join(','), "\n"
    }
  end

  def show
    @category = Category.find_by_cid(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save

    end
  end
  def destroy
    category = Category.find_by(cid: params[:id])
    if category.destroy
      redirect_to [:admin, category]
    end
  end
  def edit
    @category = Category.find_by_cid(params[:id])
    @products = Product.all
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to [:admin, @category]
    else
      render "edit"
    end
  end

  private
  def category_params
    params.require(:category).permit(
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
        :remove_img
    )
  end
end

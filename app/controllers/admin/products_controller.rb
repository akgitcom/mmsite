class Admin::ProductsController < Admin::ApplicationController
  before_filter :authenticate_user!

  def index
    @products = Product.order("id DESC").page(params[:page]).per(5)
    @title = 'product manage'
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def new
    @product = Product.new
    @faqs = Faq.all
    @relatefaqs = @product.faqs
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:images]
        params[:images].each { |image|
          @product.photos.create(image: image)
        }
      end
      flash[:notice] = "Your product has been created."
      redirect_to @product
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    if product.destroy
      redirect_to [:admin, product]
    end
  end

  def edit
    @product = Product.find_by_id(params[:id])
    @faqs = Faq.all
    @relatefaqs = @product.faqs
  end

  def update
    @product = Product.find_by_id(params[:id])
    if @product.update(product_params)
      if params[:images]
        params[:images].each { |image|
         @product.photos.create(image: image)
        }
      end
      flash[:notice] = "Product has been updated."
      redirect_to [:admin, @product]
    else
      render "edit"
    end
  end

  private
  def product_params
    params.require(:product).permit(
        :category_id,
        :title,
        :keywords,
        :description,
        :content,
        :shortcontent,
        :img,
        :images,
        :sblock,
        :sort,
        :seotitle,
        :routename,
        faq_ids: []
    )
  end
end

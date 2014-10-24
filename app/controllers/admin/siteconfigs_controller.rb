class Admin::SiteconfigsController < Admin::ApplicationController
  def edit
    @siteconfig = Siteconfig.find(1)
  end
  def update
    @siteconfig = Siteconfig.find_by_id(params[:id])
    if @siteconfig.update(siteconfig_params)
      redirect_to :action=>'edit'
    else
      flash[:$ERROR_INFO]
      render "edit"
    end
  end
  private
  def siteconfig_params
    params.require(:siteconfig).permit(
      :companyname,
      :title,
      :keywords,
      :description,
      :address,
      :img,
      :article_title,
      :article_keywords,
      :article_description,
      :product_title,
      :product_keywords,
      :product_description,
      :faq_title,
      :faq_keywords,
      :faq_description,
      :guestbook_title,
      :guestbook_keywords,
      :guestbook_description,

    )
  end
end
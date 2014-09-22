class Admin::SinglepagesController < Admin::ApplicationController
  before_filter :authenticate_user!
  # skip_before_filter :verify_authenticity_token, :only => [:new_from_disk]
  included(SinglepagesHelper)
  def index
    @singlepages = Singlepage.order("sid DESC").page(params[:page]).per(5)
    @title = 'singlepage manage'
  end
  def show
    @singlepage = Singlepage.find_by_sid(params[:id])
  end
  def edit
    @singlepage = Singlepage.find_by_sid(params[:id])
  end
  def update
    @singlepage = Singlepage.find(params[:id])
    if @singlepage.update(singlepage_params)
      redirect_to [:admin, @singlepage]
    else
      render "edit"
    end
  end
  private
  def singlepage_params
    params.require(:singlepage).permit(:seotitle, :keywords, :description, :title, :shortcontent, :content, :sort, :sblock)
  end
end

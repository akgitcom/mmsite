class SinglepagesController < ApplicationController
  def index
    @singlepages = Singlepage.order("sid DESC").page(params[:page]).per(5)
    @title = 'singlepage manage'
  end
  def show
    @singlepage = Singlepage.find_by_sid(params[:sid])
    redirect_to not_found_path unless @singlepage
  end
end

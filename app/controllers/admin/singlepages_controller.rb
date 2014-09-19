class Admin::SinglepagesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @singlepages = Singlepage.order("sid DESC").page(params[:page]).per(5)
    @title = 'singlepage manage'
  end
  def show
    @singlepage = Singlepage.find_by_sid(params[:sid])
  end
end

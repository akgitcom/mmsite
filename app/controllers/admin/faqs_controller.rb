class Admin::FaqsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @faqs = Faq.order("fid DESC").page(params[:page]).per(5)
    @title = 'Faq manage'
  end
  def show
    @faq = Faq.find_by_fid(params[:id])
  end
end

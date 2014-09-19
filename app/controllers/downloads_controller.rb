class DownloadsController < ApplicationController
  def index
    @downloads = Download.order("did DESC").page(params[:page]).per(5)
    @title = 'download manage'
  end
  def show
    @download = Download.find_by_did(params[:id])
  end
end

# app/controllers/urls_controller.rb
class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url
    else
      render :new
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  def redirect
    @url = Url.find_by(shortened_url: params[:short_url])
    if @url
      redirect_to @url.original_url, allow_other_host: true
    else
      render plain: "URL not found", status: :not_found
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
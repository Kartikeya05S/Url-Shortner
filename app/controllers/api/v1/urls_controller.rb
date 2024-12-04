class Api::V1::UrlsController < ApplicationController
  before_action :authenticate

  def create
    url = Url.new(original_url: params[:original_url])
    if url.save
      render json: { shortened_url: url.shortened_url }, status: :created
    else
      render json: { errors: url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def authenticate
    token = request.headers['Authorization']
    head :unauthorized unless token == 'YOUR_API_TOKEN'
  end
end
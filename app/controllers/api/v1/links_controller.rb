class Api::V1::LinksController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def update
    link = Link.find(params[:id])
    require "pry"; binding.pry
    if link.update_attributes(link_params) && link.valid?
      render json: link
    else
      render status: 500
    end
  end

  private

  def link_params
    params.require(:link).permit(:id, :title, :url, :read)
  end
end

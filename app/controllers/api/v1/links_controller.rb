class Api::V1::LinksController < ApplicationController

  def update
    link = Link.find(params[:id])
    if link.update(link_params) && link.valid?
      flash[:notice] = "'#{link.title}' updated."
    else
      flash[:error] = "'#{link.title}' was not updated."
    end
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:id, :title, :url, :read)
  end
end

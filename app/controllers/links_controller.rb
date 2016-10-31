class LinksController < ApplicationController

  def index
    @user = current_user
    @links = current_user.links if current_user
  end

  def create
    link = Link.new(title: params[:link][:title], url: params[:link][:url], user: current_user)
    validate_link(link)
    # require "pry"; binding.pry
    redirect_to root_path
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      flash[:notice] = "'#{link.title}' updated."
    else
      flash[:error] = "'#{link.title}' was not updated."
    end
  end

  private

  def validate_link(link)
    if link.valid?
      link.save
      flash[:success] = "link added!"
    else
      flash[:error] = link.errors.full_messages.join(', ')
    end
  end

  def link_params
    params.require(:link).permit(:id, :title, :url, :read, :authenticity_token)
  end
end

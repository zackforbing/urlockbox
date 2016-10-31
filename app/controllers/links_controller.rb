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

  private

  def validate_link(link)
    require "pry"; binding.pry
    if link.valid?
      link.save
      flash[:success] = "link added!"
    else
      flash[:error] = link.errors.full_messages.join(', ')
    end
  end
end

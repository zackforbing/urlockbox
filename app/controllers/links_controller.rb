class LinksController < ApplicationController

  def index
    @user = current_user
    @links = current_user.links if current_user
  end

  def create
    link = Link.new(title: params[:link][:title], url: params[:link][:url], user: current_user)
    validate_link(link)
    redirect_to root_path
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params) && link.valid?
      flash[:notice] = "'#{link.title}' updated."
    else
      flash[:error] = "'#{link.title}' was not updated."
    end
    redirect_to root_path
  end

  def toggle_read
    link = Link.find(params[:id])
    if link.read
      link.read = false
      link.save
    else
      link.read = true
      link.save
    end
    redirect_to root_path
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
    params.require(:link).permit(:title, :url, :read)
  end
end

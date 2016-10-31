class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end

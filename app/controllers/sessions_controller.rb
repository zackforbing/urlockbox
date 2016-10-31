class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = "Could not create account. Try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged out"
    redirect_to login_path
  end
end

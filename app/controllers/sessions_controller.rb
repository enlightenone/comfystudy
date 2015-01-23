class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.user.id
      redirect_to  searches_path
    else
      render :new
    end

  end

  def destroy
     session[:user_id] = nil
     redirect_to '/login'
  end



end

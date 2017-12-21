class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      set_current_user
      redirect_to user_path(@user)
    else
      flash[:notice] = "Incorrect password"
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end

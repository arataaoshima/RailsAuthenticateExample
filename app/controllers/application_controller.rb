class ApplicationController < ActionController::Base

  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:danger] = "You need to log in first"
      redirect_to("/login_form")
    end
  end

  def logegd_in_user
    if @current_user
      flash[:danger] = "You have already logged in"
      redirect_to("/posts/index")
    end
  end

  def check_correct_user
    @user = User.find_by(id: params[:id])
    if @current_user.id != @user.id
      flash[:danger] = "You are not the correct user"
      redirect_to("/posts/index")
    end

  end

end

class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:index, :show,:edit, :update, :logout]}
  before_action :logegd_in_user, {only:[:new, :create, :login_form, :login]}
  before_action :check_correct_user, {only:[:edit, :update, :show]}

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:username], email:params[:email], password: params[:password])
    if @user.save
    session[:user_id] = @user.id
    flash[:success] = "Your account is successfully created"
    redirect_to("/posts/index")
    else
      render("/users/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
    redirect_to("/users/index")
    else
      render("/users/edit")
    end
  end

  def login_form

  end

  def login

    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "You have successfully logged in"
      redirect_to("/posts/index")
    else
      flash[:danger] = "Email or Password is Wrong"
      render("/users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/login_form")
  end

end

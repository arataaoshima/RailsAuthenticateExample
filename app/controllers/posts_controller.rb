class PostsController < ApplicationController

  before_action :authenticate_user

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content], user_id: @current_user.id)
    if @post.save
      flash[:success] = "Post is successfully created"
    redirect_to("/posts/index")
    else
      render("/posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:success] = "The post is successfully edited"
      redirect_to("/posts/#{@post.id}")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "The post is successfully deleted"
    redirect_to("/posts/index")
  end

end

class PostsController < ApplicationController
  def index
    @posts = Post.all


    #if session[:user_id]
    #  @user = User.find_by(id: session[:user_id])
    #end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def create

    if session[:user_id]
      #@user = User.find_by(id: session[:user_id])
      @post = Post.new(post_params)
      if @post.save
        redirect_to root_path, notice: "Sikeres poszt létrehozás!"
      else
        render :'posts/new'
      end

    end
  end

  private
  def post_params
    params.require(:post).permit(:petname, :age, :description).merge(user_id: session[:user_id])
  end
end

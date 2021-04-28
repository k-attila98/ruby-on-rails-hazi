class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def new
    if session[:user_id]
      @post = Post.new
    else
      redirect_to root_path, notice: "Ehhez a művelethez be kell jelentkezni!"
    end

  end

  def create
    if session[:user_id]
      @post = Post.new(post_params)
      if @post.save
        redirect_to root_path, notice: "Sikeres poszt létrehozás!"
      else
        render :'posts/new'
      end

    else
      redirect_to root_path, notice: "Ehhez a művelethez be kell jelentkezni!"
    end

  end

  def my_posts
    if session[:user_id]
      @posts = Post.where(user_id: session[:user_id])
    else
      redirect_to root_path, notice: "Ehhez a művelethez be kell jelentkezni!"
    end
  end

  def edit
    if session[:user_id] && session[:user_id] == Post.find(params[:id]).user_id
      @post = Post.find(params[:id])
    else
      redirect_to root_path, notice: "Ehhez a művelethez nincs jogosultságod!"
    end

  end

  def update
    if session[:user_id] && session[:user_id] == Post.find(params[:id]).user_id
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    else
      redirect_to root_path, notice: "Ehhez a művelethez nincs jogosultságod!"
    end
  end

  def destroy
    if session[:user_id] && session[:user_id] == Post.find(params[:id]).user_id
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to my_posts_path
    else
      redirect_to root_path, notice: "Ehhez a művelethez nincs jogosultságod!"
    end
  end

  private
  def post_params
    if session[:user_id]
      params.require(:post).permit(:petname, :age, :description, :species, :image).merge(user_id: session[:user_id])
    end
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user

  def index
    @posts = Post.order(id: :desc)
  end


  def new
    @post = Post.new
  end

  def show
    set_post
   
  end
  


  def create 
    @post = Post.new(user_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to :posts
    else
      flash[:alert] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    set_post
  end

  def update
    @post = set_post
      if @post.update_attributes(user_params)
        flash[:notice] = "Post was successfully updated"
        redirect_to  :posts
      else
        flash[:alert] = "Something went wrong"
        render 'edit'
      end
  end
  

  def destroy
    @object = Post.find(params[:id])
    if @object.destroy
      flash[:notice] = 'Post was successfully deleted.'
      redirect_to posts_url
    else
      flash[:alert] = 'Something went wrong'
      redirect_to 'index'
    end
  end
  
  
  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = current_user if user_signed_in?
  end

  def user_params
    params.require(:post).permit(:title, :body, :category_id)
  end

end
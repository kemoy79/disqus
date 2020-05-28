class PostsController < ApplicationController

  def index
    @user = current_user if user_signed_in?
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
    @object = Object.find(params[:id])
    if @object.destroy
      flash[:notice] = 'Post was successfully deleted.'
      redirect_to objects_url
    else
      flash[:alert] = 'Something went wrong'
      redirect_to objects_url
    end
  end
  
  
  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def user_params
    params.require(:post).permit(:title, :body, :category_id)
  end

end
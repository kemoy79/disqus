class PostsController < ApplicationController

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
    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to :posts
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
   
  end

  def update
    @object = Object.find(params[:id])
      if @object.update_attributes(params[:object])
        flash[:success] = "Post was successfully updated"
        redirect_to @object
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  def def destroy
    @object = Object.find(params[:id])
    if @object.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to objects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to objects_url
    end
  end
  
  
  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def user_params
    params.require(:post).permit(:title, :body, :category_id, :user_id)
  end

end
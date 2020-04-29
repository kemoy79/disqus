class PostsController < ApplicationController

  def index
    @posts = Post.all

  end


  def new
    
  end

  def show
   
  end
  


  def create
    @object = Object.new(params[:object])
    if @object.save
      flash[:success] = "Object successfully created"
      redirect_to @object
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
        flash[:success] = "Object was successfully updated"
        redirect_to @object
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  def def destroy
    @object = Object.find(params[:id])
    if @object.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to objects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to objects_url
    end
  end
  
  
  
  

end
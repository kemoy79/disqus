class SessionsController < ApplicationController

    def def new
    
    end


    def create

      user = User.find_by(eamil: params[:session][:eamil].downcase)

      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = "Logged in succesfully"
        redirect_to :posts
      else
        flash.now[:alert] = "Invalid credentials"
        render 'new'
      end
     
    end
    
    def destroy
      session[:user_id] = nil  
      flash[:notice] = "You are logged out!"
      redirect_to root_path  
    end

end
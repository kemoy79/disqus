# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are logged in!"
      redirect_to :users
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :eamil, :password)
  end
end

# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :set_user
  def index
    @title = 'Home'
  end

  def about
    @title = "About"
  end

  def set_user
    @user = current_user if user_signed_in?
  end

end

# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @user = current_user if user_signed_in?
    @title = 'Home'
  end

  def about
  end
end

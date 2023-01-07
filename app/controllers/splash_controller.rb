class SplashController < ApplicationController
  def index
    if user_signed_in?
      redirect_to categories_path
    else
      render 'splash'
    end
  end
end

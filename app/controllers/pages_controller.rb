class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :composants]

  def home
  end

  def composants
    @user = current_user
  end
end

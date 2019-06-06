class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :composants]

  def home
    redirect_to events_path unless current_user.nil?
  end

  def composants
    @user = current_user
  end
end

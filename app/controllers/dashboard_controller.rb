class DashboardController < ApplicationController

  def index
    @tasks = Task.includes(:user).all
    @users = User.all
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
    @current_user = current_user
  end
end

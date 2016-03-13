class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:username])
    render_404 && return if @user.nil?
    render_empty_collection "user" if @user.items.count.zero?
  end

end


class ShrineUsersController < ApplicationController

  def new
    @user = current_user
    @invite = ShrineUser.new
    @invite.user_id = @user
  end

  def create

  end
end

class ShrineUsersController < ApplicationController
  def index
    @invites = ShrineUser.where("user_id = ?", current_user)
  end

  def new
    @invite = ShrineUser.new
    @invite.shrine_id = Shrine.find(params[:shrine_id])
  end

  def create
    @email = params[:query]
    @user = User.find_by(email: @email)
    @invite = ShrineUser.new
    @invite.user = @user
    @invite.shrine_id = params[:shrine_id]
    if @invite.save
      redirect_to shrines_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # private

  # def shrine_user_params
  #   params.require(:shrine_user).permit(:query, :shrine_id)
  # end
end

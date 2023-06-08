class ShrineUsersController < ApplicationController
  def index
    @invites = ShrineUser.where(user_id: current_user.id, status: "pending")
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

  def update
    shrine_user = ShrineUser.find(params[:id])
    shrine_user.update(status: params[:status])
    redirect_to shrine_path(shrine_user.shrine_id)
  end

  private

  def shrine_user_params
    params.require(:shrine_user).permit(:status, :shrine_id)
  end
end

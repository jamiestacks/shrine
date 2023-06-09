class ShrinesController < ApplicationController
  before_action :set_shrine, only: []
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @invites = ShrineUser.where(user_id: current_user.id, status: "accept")
    @invites += Shrine.where(user_id: current_user.id)
    # @shrines = @invites.map(&:shrine) <------ one liner alternative to above
    @shrines = @invites.map do |invite|
      if invite.class.method_defined?(:shrine)
        invite.shrine
      else
        invite
      end
    end.uniq
  end

  def show
    @shrine = Shrine.find(params[:id])
    @invite = ShrineUser.new
    @invite.shrine_id = Shrine.find(params[:id])
  end

  def new
    @shrine = Shrine.new
  end

  def create
    @shrine = Shrine.new(shrine_params)
    @shrine.user = current_user
    if @shrine.save
      redirect_to shrines_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shrine = Shrine.find(params[:id])
  end

  def update
    @shrine = Shrine.find(params[:id])
    if @shrine.update(shrine_params)
      redirect_to shrines_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shrine = Shrine.find(params[:id])
    @shrine.destroy
    redirect_to shrines_path, status: :see_other
  end

  private

  def authorize_user!
    set_shrine
    unless current_user == @shrine.user || current_user.admin?
      redirect_to root_path, alert: 'You do not have permission to perform this action.'
    end

  end

  def set_shrine
    @shrine = Shrine.find(params[:id])
  end

  def shrine_params
    params.require(:shrine).permit(:first_name, :family_name, :dob, :dod, :photo, :biography)
  end
end

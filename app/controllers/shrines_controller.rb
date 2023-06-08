class ShrinesController < ApplicationController
  before_action :set_shrine, only: []
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @invites = ShrineUser.where(user_id: current_user.id, status: "accept")
    # @shrines = @invites.map(&:shrine) <------ one liner alternative to above
    @shrines = @invites.map do |invite|
      invite.shrine
    end
    @condition = @invites.count.zero? && Shrine.where(user_id: current_user.id).count.zero?
    @ownshrines = Shrine.where(user_id: current_user)
  end

  def show
    @shrine = Shrine.find(params[:id])
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
    dob = Chapter.new(title: "#{@shrine.first_name}'s first day", date_start: @shrine.dob, date_end: @shrine.dob, shrine_id: @shrine.id)
    dob.save
    dod = Chapter.new(title: "#{@shrine.first_name}'s last day", date_start: @shrine.dod, date_end: @shrine.dod, shrine_id: @shrine.id)
    dod.save
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
    unless current_user == @story.user || current_user.admin?
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

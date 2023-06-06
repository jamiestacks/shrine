class ShrinesController < ApplicationController
  before_action :set_shrine, only: []

  def index
    @shrines = Shrine.all
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

  def set_shrine
    @shrine = Shrine.find(params[:id])
  end

  def shrine_params
    params.require(:shrine).permit(:name, :dob, :dod)
  end
end

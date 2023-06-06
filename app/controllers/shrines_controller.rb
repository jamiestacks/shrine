class ShrinesController < ApplicationController
  def index
    @shrines = Shrine.all
  end

  def show
    @shrine = Shrine.find(params[:id])
  end

  def new

  end

  def create

  end
end

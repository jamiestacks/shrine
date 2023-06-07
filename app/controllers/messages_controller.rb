class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @shrine = Shrine.find(params[:shrine_id])
    @message = Message.new
  end

  def create

  end
end

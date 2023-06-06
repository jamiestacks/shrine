class MessagesController < ApplicationController
  def index
    @shrine = Shrine.find(params[:shrine_id])
    @message = Message.new
  end

  def create

  end
end

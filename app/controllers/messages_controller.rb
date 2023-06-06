class MessagesController < ApplicationController
  def index
    @shrine = Shrine.find(params[:shrine_id])
  end
end

class MessagesController < ApplicationController
  def index
    @shrine = Shrine.find(params[:shrine_id])
    @message = Message.new
  end

  def create
    @shrine = Shrine.find(params[:shrine_id])
    @message = Message.new(message_params)
    @message.shrine = @shrine
    @message.user = current_user
    if @message.save
      redirect_to shrine_messages_path(@shrine)
    else
      render "messages/index", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end

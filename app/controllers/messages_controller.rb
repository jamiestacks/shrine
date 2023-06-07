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
      ShrineChannel.broadcast_to(
        @shrine,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "messages/index", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

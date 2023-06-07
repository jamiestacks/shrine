class ShrineChannel < ApplicationCable::Channel
  def subscribed
    shrine = Shrine.find(params[:id])
    stream_for shrine
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class MessagesChannel < ApplicationCable::Channel

  def subscribed
    p params
    #  stream_from "messages_abc"
  end

  def unsubscribed
    current_user.disappear
  end

  def appear(data)
    p "......... #{data['m']}"
    stop_all_streams
    stream_from "#{data['m']}"
  end

  def away
    current_user.away
  end

end

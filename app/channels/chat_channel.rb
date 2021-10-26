class ChatChannel < ApplicationCable::Channel

    def subscribed
        puts "subscribed"
        stream_from "chat_channel"
        ActionCable.server.broadcast("chat_channel", { message: "connected" })
    end

    def unsubscribed
    end

    def receive(data)
        puts "message"
        puts data
        ActionCable.server.broadcast("chat_channel", { message: "testing...." })
    end

end
class ChatController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def page
        if(session[:user_login] == nil)
            redirect_to "/login"
            return
        end
        @connected_user = User.find_by(login: session[:user_login])
    end

    def send_message
        ActionCable.server.broadcast("chat_channel", { username: params[:username], message: params[:message] })
        render json: "ok"
    end

end
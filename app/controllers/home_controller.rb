class HomeController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        if(session[:user_login] == nil)
            redirect_to action: "login"
            return
        end
        TestLogJob.perform_later
        @connected_user = User.find_by(login: session[:user_login])
        return
    end
  
    def login
        if(session[:user_login] != nil)
            redirect_to action: "index"
            return
        end
        return
    end
  
    def connect
        @user = User.find_by(login: params[:login])
        # if @user == nil
        #   render json: "user_not_found"
        # end
        # if @user.password == params[:password]
        #   render json: "wrong_password"
        # end
        # session[:user_login] = @user.login
        # render json: "ok"
        
        if @user == nil
            render json: "user_not_found"
        elsif @user.verify().is_password?(params[:password])
            session[:user_login] = @user.login
            session[:user] = @user
            render json: "ok"
        else
            render json: "wrong_password"
        end
    end

end
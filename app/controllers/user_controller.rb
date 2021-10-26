class UserController < ApplicationController
    skip_before_action :verify_authenticity_token

    def list
        if(session[:user_login] == nil)
            redirect_to "/login"
            return
        end
        @users = Rails.cache.read("users")
        # puts Rails.cache.read("users")
        if(@users == nil)
            puts "empty cache"
            @users = User.all
            Rails.cache.write("users", @users)
        end
        @connected_user = session[:user]
    end

    def add
        if(session[:user_login] == nil)
            redirect_to "/login"
            return
        end
        @connected_user = User.find_by(login: session[:user_login])
    end

    def save
        @user = User.new
        @user.login = params[:username]
        @user.password = params[:password]
        @user.firstname = params[:firstname]
        @user.lastname = params[:lastname]
        @user.createdAt = DateTime.now()
        @user.updatedAt = DateTime.now()
        @user.encrypt()
        @user.save
        if(session[:user_login] == nil)
            redirect_to "/login"
            return
        end
        redirect_to action: "list"
    end

    def edit
        if(session[:user_login] == nil)
            redirect_to "/login"
            return
        end
        @user = User.find(params[:login])
        @connected_user = User.find_by(login: session[:user_login])
    end

    def update
        if(session[:user_login] == nil)
            redirect_to "/login"
            return
        end
        @user = User.find(params[:old_username])
        @user.login = params[:username]
        @user.password = params[:password]
        @user.firstname = params[:firstname]
        @user.lastname = params[:lastname]
        @user.createdAt = DateTime.now()
        @user.updatedAt = DateTime.now()
        @user.encrypt()
        @user.save
        redirect_to action: "list"
    end

    def delete
        if(session[:user_login] == nil)
            redirect_to "/login"
            return
        end
        @user = User.find(params[:login])
        @user.delete
        redirect_to action: "list"
    end

    def checkUsername
        # @user = User.find(params[:login])  #renvoi une exception si aucun utilisateur trouvé
        @user = User.find_by(login: params[:login])   #renvoi NIL si aucun utilisateur trouvé
        if @user == nil
            render json: "unique"
        else
            render json: "not_unique"
        end
    end

    def disconnect
        session.clear
        redirect_to "/login"
    end

end
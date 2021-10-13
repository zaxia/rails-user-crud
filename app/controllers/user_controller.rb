class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

    def list
      if(session[:user_login] == nil)
        redirect_to "/login"
        return
      end
      @users = User.all
    end

    def add
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

  end
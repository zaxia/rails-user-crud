class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      if(session[:user_login] == nil)
        redirect_to action: "login"
        return
      end
      @user = User.find_by(login: session[:user_login])
    end
    
    def login
      if(session[:user_login] != nil)
        redirect_to action: "index"
        return
      end
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
        render json: "ok"
      else
        render json: "wrong_password"
      end
    end

    
    def test_calcul
      start_time = Time.now
      sums = Array.new
      times = Array.new
      for i in 0..999
        var1 = (rand(10000000)) / 100.0
        var2 = (rand(10000000)) / 100.0
        sum = var1 + var2
        time = var1 * var2
        # puts "#{i} : #{var1} + #{var2} = #{sum}"
        # puts "#{i} : #{var1} * #{var2} = #{time}"
        sums.push(sum)
        times.push(time)
      end
      
      end_time = Time.now
      render json: {
        sums: sums,
        times: times,
        ellapsed_time: end_time - start_time
      }
    end

  end
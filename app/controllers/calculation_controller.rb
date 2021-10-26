class CalculationController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def page
        if(session[:user_login] == nil)
            redirect_to "/login"
            return
        end
        @connected_user = User.find_by(login: session[:user_login])
    end
    
    def test
        min_time = nil
        max_time = nil
        ellapsed_times = Array.new
        # sums = Array.new
        # times = Array.new
        # divs = Array.new
        for j in 0..99
            start_time = Time.now
            for i in 0..999999
            var1 = (rand(10000000)) / 100.0
            var2 = (rand(10000000)) / 100.0
            sum = var1 + var2
            time = var1 * var2
            div = var1 / var2
            # puts "#{i} : #{var1} + #{var2} = #{sum}"
            # puts "#{i} : #{var1} * #{var2} = #{time}"
            # sums.push(sum)
            # times.push(time)
            # divs.push(div)
            end
            end_time = Time.now
            ellapsed_time = end_time - start_time
            if(min_time == nil || min_time > ellapsed_time)
            min_time = ellapsed_time
            end
            if(max_time == nil || max_time < ellapsed_time)
            max_time = ellapsed_time
            end
            ellapsed_times.push(ellapsed_time)
        end

        render json: {
            min_time: min_time * 1000,
            max_time: max_time * 1000,
            avg: (ellapsed_times.inject(0.0) { |sum, el| sum + el } / ellapsed_times.size) * 1000
        }
    end

end
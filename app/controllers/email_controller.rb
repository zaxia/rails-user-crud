class EmailController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def page
        if(session[:user_login] == nil)
            redirect_to "/login"
            return
        end
        @connected_user = User.find_by(login: session[:user_login])
        # render template: "email/page"
        return
    end
    
    #POST /email/send
    def send_mail
        TestMailer.with(to: params[:to], subject: params[:subject], body: params[:mail_body]).new_test_email.deliver_now
        # TestMailer.auto_test_email.deliver_later
        render json: "ok"
    end

end
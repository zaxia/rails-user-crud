class TestMailer < ApplicationMailer
    def new_test_email
        @to = params[:to]
        @subject = params[:subject]
        @body = params[:body]
        mail(to: @to, subject: @subject, body: @body)
    end

    def auto_test_email
        mail(to: "bossard.zacharie@hotmail.fr", subject: "Email automatique ruby")
    end
  end
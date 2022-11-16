class UserMailer < ApplicationMailer
    
    
    def welcome_email(user)
        @user = user
        @url = 'bootsandcats@boxbeat.com'
        mail(to: @user.username, subject: "I'm so so so tired")
    end

end

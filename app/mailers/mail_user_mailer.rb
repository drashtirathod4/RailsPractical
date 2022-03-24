class MailUserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        attachments.inline['welcome.png'] = File.read('app/assets/images/welcome.png')
        mail(to: email_address_with_name(@user.email, @user.name), subject: 'Welcome to this website') do |format|
            format.html { render layout: 'welcome_layout' }
            format.text
        end
    end

    def email_changed(user)
        @user = user
        mail(to: email_address_with_name(@user.email, @user.name), subject: 'Email is Changed') do |format|
            format.html { render layout: 'email_change_layout' }
            format.text
        end
    end
end

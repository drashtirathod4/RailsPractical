class MailUser < ApplicationRecord
    mount_uploader :picture, PictureUploader
    validates_presence_of :name, :email
    validates :email, uniqueness: true
    before_update :send_mail

    # To send mail only if user changes his email
    def send_mail
        @user = MailUser.find_by_id(self.id)
        if @user.email != self.email
            prev_mail = @user.email
            MailUserMailer.email_changed(@user).deliver_later
        end
    end
end

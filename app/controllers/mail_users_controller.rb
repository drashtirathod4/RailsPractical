class MailUsersController < ApplicationController
  # GET	/mail_users
  def index
    @users = MailUser.all
  end

  # GET	/mail_users/1
  def show
    @user = MailUser.find(params[:id])
  end

  # GET	/mail_users/new
  def new
    @user = MailUser.new
  end

  # POST	/mail_users
  def create 
    @user = MailUser.create(mail_user_params)
    if @user.valid?
      MailUserMailer.welcome_email(@user).deliver_later
      redirect_to mail_users_path
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to new_mail_user_path
    end
  end

  # GET	/mail_users/1/edit
  def edit
    @user = MailUser.find(params[:id])
  end

  # PUT/PATCH	/mail_users/1
  def update 
    @user = MailUser.find(params[:id])
    @user.update(mail_user_params)
    if @user.valid?
      redirect_to mail_user_path
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_mail_user_path(@user)
    end
  end

  # DELETE	/mail_users/1
  def destroy
    @user = MailUser.find(params[:id])
    @user.destroy
    redirect_to mail_users_path
  end

  private
  def mail_user_params 
    params.require(:mail_user).permit(:name, :email, :picture)
  end
end

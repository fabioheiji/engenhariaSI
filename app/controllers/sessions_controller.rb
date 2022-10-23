class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to matches_path, notice: 'Logged in successfully'
    else
      flash.now.alert = 'Incorrect email or password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'Logged Out'
  end
end
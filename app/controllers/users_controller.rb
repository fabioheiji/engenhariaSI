class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'Usuário criado com sucesso'
    else
      render :new, status: :unprocessable_entity, content_type: 'text/html'
      headers['Content-Type'] = 'text/html'
    end
  end

  def show
    @user = current_user
  end

  private
  def user_params
    params
      .require(:user)
      .permit(:name, :email, :password, :password_confirmation, :birth_date, :position)  
  end
end

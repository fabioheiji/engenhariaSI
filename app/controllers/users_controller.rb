class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to '/login'
        else
            render :new, status: :unprocessable_entity, content_type: "text/html"
            headers["Content-Type"] = "text/html"
        end
    end

    private
    def user_params
        params
            .require(:user)
            .permit(:name, :email, :password, :password_confirmation, :birth_date, :position)
        
    end
end

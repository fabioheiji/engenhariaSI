class UsersController < ApplicationController
    def new
    end
    
    def create
        @user = User.new(user_params) 
        @user.save
    end

    private
    def user_params
        data = params
            .require(:user)
            .permit(:name, :email, :password, :birth_date, :position)
        
    end
end

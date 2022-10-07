class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params) 
        if @user.save
            redirect_to '/login'
        else
            render 'new'
        end
    end

    private
    def user_params
        data = params
            .require(:user)
            .permit(:name, :email, :password, :birth_date, :position)
        
    end
end

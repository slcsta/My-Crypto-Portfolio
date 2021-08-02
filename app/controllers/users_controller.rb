class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to @user, alert: "successful sign-up"
        else 
            render :new, alert: "signup error, please try again"
        end
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end

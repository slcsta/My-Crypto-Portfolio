class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:message] = "Successful sign up!"
            # redirect_to user_path(@user) 
            redirect_to '/'
        else 
            flash[:error] = "Error! Please try again."
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        # byebug
    end

    private

    def user_params

        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end

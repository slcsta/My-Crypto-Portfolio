class SessionsController < ApplicationController 
    
    def new

    end

    def create 
    # 1. search our database for the user entry that matches the username provided in the login form, 
        @user = User.find_by(username: params[:username])
    # 2. authenticate using bcrypt and the provided password
        return head(:forbidden) unless @user.authenticate(params[:password])
    # 3. setting the session[:user_id] and redirecting the user
        session[:user_id] = @user.id 
    # 4. redirect to the user landing page
        redirect_to user(@user)
    end

    def destroy
        
    end

end
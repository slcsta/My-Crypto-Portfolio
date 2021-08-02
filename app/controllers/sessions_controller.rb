class SessionsController < ApplicationController 
    
    def new

    end

    def create
    # in our create action we will: 
    # 1. search our database for the user entry that matches the username provided in the login form, 
    # 2. authenticate using bcrypt and the provided password
    # 3. setting the session[:user_id] and redirecting the user
        
    
    end

    def destroy
    end

end
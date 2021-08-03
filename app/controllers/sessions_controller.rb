class SessionsController < ApplicationController 
    
    def new

    end

    def create 
        #byebug
        #does the user exist in our database???
    # 1. search our database for the user entry that matches the username provided in the login form, 
        @user = User.find_by(username: params[:user][:username]) #better to use find_by because we have to put a key in here
    # 2. did we find the user and did they enter the correct password: authenticate using bcrypt and the provided password
        if @user && @user.authenticate(params[:user][:password])
    # 3. then set the session[:user_id] - 
            session[:user_id] = @user.id 
    # 4. redirect to the user landing page
            redirect_to user_path(@user)
        else
            flash[:error] = "Error! Incorrect login info. Please try again."
            redirect_to login_path
        end
    end

    def omniauth
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.email = auth['info']['email']
            u.username = auth['info']['name']
            u.password = SecureRandom.hex(20)
        end
        
        if user.valid?
            #byebug
            session[:user_id] = user.id
            flash[:message] = "Successful Login"
            redirect_to user_path
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private
    def auth
        request.env['omniauth.auth']
    end

end
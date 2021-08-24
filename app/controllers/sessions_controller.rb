class SessionsController < ApplicationController 
    
    def new
    end

    def create 
        @user = User.find_by(email: params[:user][:email]) 
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            flash[:message] = "Successful log in!"
            redirect_to '/'
        else
            flash[:error] = "Error! Incorrect log in info. Please try again."
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
            session[:user_id] = user.id
            flash[:message] = "Successful Login!"
            redirect_to '/'
        else
            flash[:error] = "Error! Please try again."
            redirect_to '/'
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
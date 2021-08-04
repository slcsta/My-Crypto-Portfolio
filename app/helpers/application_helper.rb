module ApplicationHelper
    def current_user
        # set my current user to an instance variable @current_user, so @current_user or @current_user = User.find_by_id(session[:user_id])
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in
        # want to return true here if current user exists
        !!current_user
    end
end

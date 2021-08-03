module ApplicationHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in
        # want to return true here if current user exists
        !!current_user
    end
end

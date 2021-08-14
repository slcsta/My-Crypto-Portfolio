class ApplicationController < ActionController::Base
    include ApplicationHelper #this gives me access to helper methods in ALL controllers

    private
    # a method just for my controllers is a private method
    def redirect_if_not_logged_in?
        if !logged_in
            redirect_to login_path
        end
    end
end

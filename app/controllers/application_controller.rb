class ApplicationController < ActionController::Base
    include ApplicationHelper #this gives me access to those helper methods for ALL controllers

    private
    def redirect_if_not_logged_in?

    end
end

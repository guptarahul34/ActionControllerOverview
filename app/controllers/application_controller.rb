class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
    def record_not_found
      render plain: "404 Not Found", status: 404
    end
    
    
    private

    def current_user
        @_current_user ||= session[:current_user_id] &&
          User.find_by(id: session[:current_user_id])
    end
    
end

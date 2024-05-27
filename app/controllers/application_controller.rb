class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find_or_create_by(ip_address: request.remote_ip)
    end
end

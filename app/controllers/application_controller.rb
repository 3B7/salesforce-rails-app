class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'hello' && password == 'world'
    end
  end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_authorized_user
      if !current_user
        flash[:error] = "You must be logged in to access this page!"
        redirect_to root_url
      end
    end

    def require_authorized_salesforce_user
      if !current_user.salesforce_producer_id?
        redirect_to news_url
      end
    end

    def require_admin_user
      unless User.authorized_user_ids.include?(current_user.id)
        flash[:warning] = "You need to be an administrator to access this page"
        redirect_to root_url
      end
    end

    def fetch_client
      @client = Salesforce::Connection.authenticated_client
    end
  
end

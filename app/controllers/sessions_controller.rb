class SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth["provider"], :uid => auth["uid"]).first_or_initialize(
      :refresh_token => auth["credentials"]["refresh_token"],
      :access_token => auth["credentials"]["token"],
      :expires => Time.at(auth["credentials"]["expires_at"]),
      :name => auth["info"]["name"],
      :email => auth["info"]["email"], 
      :image => auth["info"]["image"],
      :last_request_at =>  Time.now,
      :ip_address => request.remote_ip
    )
    url = session[:return_to] || root_path
    session[:return_to] = nil
    url = root_path if url.eql?('/logout')

    if user.save
      session[:user_id] = user.id
    else
      session[:user_id] = nil # destroy the sesh
      redirect_to root_url, :notice => "Failed to login"
    end

    if user.authorized?
      notice = "Signed in!"
      redirect_to url, :notice => notice
    else
      session[:user_id] = nil # destroy the sesh
      flash[:error] = "Your email is not authorized. If you believe you have reached this in error please contact your websmaster."
      redirect_to url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
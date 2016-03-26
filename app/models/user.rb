class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :refresh_token, :access_token, :expires, # omniauth stuff
                  :salesforce_producer_id, # salesforce stuff
                  :email, :image, :last_request_at, :authorized, :ip_address # RPC stuff

  ADMIN_USER_EMAILS = ['contact@gasvaluation.com']
  AUTHORIZED_EMAIL_DOMAINS = ['gasvaluation.com']

  after_create :determine_authorization

  def self.authorized_user_ids
    @user_ids = []
    ADMIN_USER_EMAILS.each do |email|
      user = User.find_by_email(email)

      @user_ids << user.id unless user.nil?
    end
    return @user_ids
  end

  def email_domain
    email.split(/@/)[1]
  end

  private 

    def determine_authorization
      if AUTHORIZED_EMAIL_DOMAINS.include?(self.email_domain)
        update_attribute(:authorized, true)
      else
        update_attribute(:authorized, false)
      end 
    end

end
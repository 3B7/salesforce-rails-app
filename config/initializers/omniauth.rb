Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["G_ID"], ENV["G_SECRET"],
    {
      :scope => "email, profile",
      :prompt => "select_account"
    }
end
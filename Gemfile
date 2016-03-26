source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '3.2.14'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

# gems specific to running on Heroku
group :production do
  gem 'rails_12factor'
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'rails-dev-tweaks',   '0.6.1'
  gem 'thin'
  gem 'capybara'
  gem 'rspec-rails',        '2.14.0'
  gem "factory_girl_rails", "~> 4.0"
  gem 'shoulda-matchers'
end

gem 'sprockets', '2.2.3' 
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jbuilder'
gem 'restforce'
gem 'figaro'
gem 'omniauth-google-oauth2'
gem 'delayed_job_active_record'
gem 'unicorn'
gem 'rack-timeout'
gem 'httparty'
gem 'rack-ssl-enforcer'
source 'https://rubygems.org'

gem 'rails', '3.2.19'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
  gem 'faker'
  gem 'pry'
  gem 'binding_of_caller'
  gem 'better_errors'
end

group :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 3.6'
end

gem 'bootstrap-sass', '~> 3.1.1'
gem 'devise'

#markdown
gem 'redcarpet'

#image upload/manipulate
gem 'carrierwave'
gem 'mini_magick'
gem 'fog' #cloud storage

#environment variables
gem 'figaro', '1.0' 

#roles/authorization
gem 'pundit'

# make forms simpler
gem 'simple_form'
gem 'country_select'

#pagination
gem 'kaminari'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

gem 'puma'
gem 'rack-timeout'

gem 'newrelic_rpm'

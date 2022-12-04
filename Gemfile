source 'https://rubygems.org'

ruby '2.6.6'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use Haml as the templating library
gem 'haml'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails' # , '4.2.10'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development

gem 'rails-controller-testing'

gem 'carrierwave', '~> 1.0'

gem 'fog', '~> 1.38'

gem 'bootstrap-sass', '~> 2.3.2'
gem "devise"
#Run next line to set up devise
# bundle exec rails g devise:install
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'rubocop'
  gem 'web-console'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec', '~>3.5'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'simplecov', require: false
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6', '< 1.4'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '< 3.0.0'
end

group :test do
  gem 'rspec-expectations'
  gem 'cucumber-rails', '1.6.0', :require=>false
  gem 'database_cleaner'
end

group :production do
  gem 'pg', '~> 0.20' # for Heroku deployment
  gem 'rails_12factor'
end


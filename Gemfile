source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'simple_form', '~> 3.3.1'
gem 'devise', '~> 4.2.0'
gem 'rqrcode'
gem 'virtus', '~> 1.0.5'
gem 'lazyload-rails'

group :development, :test do
  gem 'pry-rails'
  gem 'factory_girl_rails', '~> 4.7.0'
end

group :test do
  gem 'rspec-rails', '~> 3.5.2'
  gem 'capybara', '~> 2.10.1'
  gem 'shoulda'
  gem 'database_cleaner', '~> 1.5.3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'letter_opener'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'rails_12factor'
  gem 'sendgrid-ruby'
end

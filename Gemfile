source 'https://rubygems.org'

ruby '2.3.3'

gem 'coffee-rails', '~> 4.1.0'
gem 'pg', '~> 0.19.0'
gem 'puma', '~> 3.6', '>= 3.6.2'
gem 'puma_worker_killer', '~> 0.0.7'
gem 'rails', '~> 5.0', '>= 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.0.0.alpha5'

gem 'high_voltage', '~> 3.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

group :development, :test do
  gem 'annotate', '~> 2.7', '>= 2.7.1'
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'pry-rails', '~> 0.3.4'
  gem 'pry-rescue', '~> 1.4', '>= 1.4.4'
  gem 'pry-stack_explorer', '~> 0.4.9.2'
end

group :development do
  gem 'capistrano', '~> 3.7', '>= 3.7.1',         require: false
  gem 'capistrano-bundler', '~> 1.2',             require: false
  gem 'capistrano-rails', '~> 1.2', '>= 1.2.1',   require: false
  gem 'capistrano-rvm', '~> 0.1.2',               require: false
  gem 'capistrano3-puma', '~> 1.2', '>= 1.2.1',   require: false
  gem 'listen', '~> 3.0.5'
  gem 'rubocop', '~> 0.46.0', require: false
  gem 'web-console'
end

group :test do
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'ffaker', '~> 2.4'
  gem 'fuubar', '~> 2.2'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
end

group :production do
  gem 'rails_12factor'
end

source 'https://rubygems.org'
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'#, '~> 1.2'

#parsers
gem 'googleajax', '~> 1.0.1'

# OmniAuth
gem "omniauth-github", "~> 1.1.1"
gem "omniauth-twitter", "~> 1.0.1"


group :development, :test do
  gem 'quiet_assets'
  gem 'letter_opener' #email gem

  gem "bullet" #orm profiling

  gem 'dotenv-rails'
  gem 'minitest'

  #gem 'minitest-rails'
  gem "rspec-rails", "~> 2.14.0"
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

# Code coverage
gem 'coveralls', require: false

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use debugger
# gem 'debugger', group: [:development, :test]

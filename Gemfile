source "https://rubygems.org"

#gem "rails", "~> 5.2.0"
gem 'rails', '~> 6.0.2'

gem "mysql2"

# rails
gem 'scenic'
gem 'scenic-mysql_adapter'
gem "activerecord-typedstore"

# js
gem "dynamic_form"
gem "jquery-rails", "~> 4.3"
gem "json"
gem "uglifier", ">= 1.3.0"

# deployment
gem "actionpack-page_caching"
gem "exception_notification"
#gem "unicorn"
gem 'puma', '~> 4.3'

# security
gem "bcrypt", "~> 3.1.2"
gem "rotp"
gem "rqrcode"

# parsing
gem "nokogiri", ">= 1.7.2"
gem "htmlentities"
gem "commonmarker", "~> 0.14"

# other
gem "oauth" # for twitter-posting bot
gem "mail" # for parsing incoming mail

gem "sitemap_generator" # for better search engine indexing
gem 'transaction_retry' # mitigate https://github.com/lobsters/lobsters-ansible/issues/39

#gem "scout_apm", "2.6.2"

# hack
gem 'sprockets', '~> 3.7.2'
# end hack

group :test, :development do
  gem "ruumba" # tests views
  gem 'bullet'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'good_migrations'
  gem "listen"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "faker"
  gem "byebug"
  gem "rb-readline"
end

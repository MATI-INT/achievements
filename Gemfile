source 'https://rubygems.org'

# Core
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'puma'

# Authentication
gem 'devise', '4.0.0.rc2'

# Files
gem 'dragonfly'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
  # Postgres
  gem 'pg'
end

# Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

# jQuery and stuff
gem 'jquery-rails'
gem 'jquery-turbolinks'

# Turbolinks
gem 'turbolinks', '~> 5.x'

# Styles
gem 'bootstrap', '~> 4.0.0.alpha3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

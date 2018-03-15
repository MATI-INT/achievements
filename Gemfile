source 'https://rubygems.org'

# Core
gem 'rails', '5.1.5'
gem 'puma'

# Authentication
gem 'devise', '~> 4.1'

# Files
gem 'dragonfly'
gem 'dragonfly-s3_data_store'

# Pagination
gem 'kaminari', '~> 1.1'

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  # Postgres
  gem 'pg', '< 1'
end

# Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2.2'

# jQuery and stuff
gem 'jquery-rails'

# Turbolinks
gem 'turbolinks', '>= 5.1.0'

# Styles
gem 'bootstrap', '~> 4.0.0'

group :development, :test do
  gem 'faker'
  gem 'pry-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

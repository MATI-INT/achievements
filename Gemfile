source 'https://rubygems.org'

# Core
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'puma'

# Authentication
gem 'devise', '~> 4.1'

# Files
gem 'dragonfly'

# Pagination
gem 'kaminari', github: 'amatsuda/kaminari', branch: 'master'

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
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

# Turbolinks
gem 'turbolinks', '>= 5.0.0.beta2'

# Styles
gem 'bootstrap', '~> 4.0.0.alpha3'

group :development, :test do
  gem 'faker'
  gem 'pry-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

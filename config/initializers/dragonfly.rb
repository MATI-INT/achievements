require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "2e192dbee78c98a71dcccd52af1e5489640febf47c5307f30b97e8640004e05d"

  url_format "/media/:job/:name"

  if Rails.env.production?
    datastore :s3,
              bucket_name: 'matiachievements',
              access_key_id: ENV['AWS_KEY'],
              secret_access_key: ENV['AWS_SECRET']
  else
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end

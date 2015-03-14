
config = YAML.load_file("#{Rails.root}/config/config.yml") || {}
CONFIG = config.merge!(config[Rails.env]) if config[Rails.env]
APP_CONFIG = config.with_indifferent_access
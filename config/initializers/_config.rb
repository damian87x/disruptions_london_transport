
config = YAML.load_file("#{Rails.root}/config/config.yml") || {}
CONFIG = config.merge!(config[Rails.env]) if config[Rails.env]
Dir[File.join(Rails.root, "lib", "core_ext", "*.rb")].each {|l| require l }
APP_CONFIG = config.with_indifferent_access
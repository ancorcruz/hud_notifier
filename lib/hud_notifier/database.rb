require 'erb'

module HudNotifier
  module Database
    module_function

    def configure
      ActiveRecord::Base.establish_connection(config_params)
    end

    def config_params
      YAML.load(ERB.new(config_file).result)[env]
    end

    def config_file
      File.read("#{Dir.pwd}/config/database.yml")
    end

    def env
      ENV['RACK_ENV'] || 'development'
    end
  end
end

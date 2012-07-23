require 'yaml'

if Rails.env == "development"
    require_dependency "produto_yaml.rb"
end


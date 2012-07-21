

if Rails.env == "development"
    Rails.cache.clear
    require_dependency "produto_yaml.rb"
end


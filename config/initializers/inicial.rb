puts 'LIMPA CACHE'
Rails.cache.clear
if Rails.env == "development"
    require_dependency "produto_yaml.rb"
end


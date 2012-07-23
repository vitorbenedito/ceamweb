
require "yaml"

task :autaliza_cache_produtos => :environment do
    
    produtos = Array.new
    
    url = Ceam::Application::URL_VPSA + '/produtos/'
    
    produtoVPSA = HTTParty.get(url)
  
    produtoVPSA.each do |p|
    
      produto = ProdutoYaml.new
      produto.nomeProduto = p['descricao']
      produto.idProduto = p['id']
    
      produtos << produto
      
    end
    
    Rails.cache.write("produtos", produtos.to_yaml)
    
end

task :autaliza_cache_produtos_vpsa => :environment do

  produtos = nil
  
  cache =  Rails.cache.read("produtosVpsa")
  
  if cache == nil
    produtos = HTTParty.get( Ceam::Application::URL_VPSA + '/produtos' )
    Rails.cache.write("produtosVpsa",produtos.to_yaml, :expires_in => 60.minutes)
  else
    produtos = YAML::load( cache )
  end

end
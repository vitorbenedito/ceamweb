
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
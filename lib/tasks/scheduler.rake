
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
    
    if produtos.length > 0
      Rails.cache.write("produtos", produtos.to_yaml, :expires_in => 60.minutes)
    end
end

task :autaliza_cache_produtos_vpsa => :environment do

  produtos = nil
  
  produtos = HTTParty.get( Ceam::Application::URL_VPSA + '/produtos' )
  if produtos.length > 0
    Rails.cache.write("produtosVpsa",produtos.to_yaml, :expires_in => 60.minutes)
  end

end
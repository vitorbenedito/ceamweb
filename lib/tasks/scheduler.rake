
require "yaml"

task :autaliza_cache_produtos => :environment do
    puts 'iniciou processamento autaliza_cache_produtos'
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
      puts 'gravou cache autaliza_cache_produtos'
    end
    
    puts 'fim autaliza_cache_produtos'
end

task :autaliza_cache_produtos_vpsa => :environment do
  puts 'iniciou processamento autaliza_cache_produtos_vpsa'
  produtos = nil
  
  produtos = HTTParty.get( Ceam::Application::URL_VPSA + '/produtos' )
  if produtos.length > 0
    Rails.cache.write("produtosVpsa",produtos.to_yaml, :expires_in => 60.minutes)
    puts 'gravou cache autaliza_cache_produtos_vpsa'
  end
  
  puts 'fim autaliza_cache_produtos_vpsa'

end
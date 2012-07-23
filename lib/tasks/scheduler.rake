
require "yaml"

task :autaliza_cache_produtos => :environment do
    
    produtos = Array.new
    
    url = Ceam::Application::URL_VPSA + '/produtos/'
    
    produtoVPSA = HTTParty.get(url)
  
    produtoVPSA.each do |p|
    
      produto = ProdutoYaml.new
      produto.nomeProduto = p['descricao']
      produto.idProduto = p['id']
      
      if edit
        @localizacao.produtos.each do |pLoc|

          if pLoc.idProduto == produto.idProduto
            produto.checked = 'checked="yes"'
            break
          end
        end
      end
    
      produtos << produto
      
    end
    
    Rails.cache.write("produtos", produtos.to_yaml)
    
end
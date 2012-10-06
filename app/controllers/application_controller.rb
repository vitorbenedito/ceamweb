class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def autenticar_usuario?
    if !usuario_logado?
      redirect_to oauth_authorization_path
    end
  end
    
  def usuario
    session[:usuario]
  end

  def usuario_logado?
    !usuario.nil?
  end
  
  def url_vpsa( api_vpsa,entidades )
    
    Ceam::Application::URL_VPSA + api_vpsa + '?token=' + usuario[:access_token] + '&entidades=' + entidades
    
  end
  
  def url_vpsa_load_produtos( idProduto, entidades )
    url_vpsa Ceam::Application::API_VPSA_PRODUTOS + '/' + idProduto, entidades
  end
  
end

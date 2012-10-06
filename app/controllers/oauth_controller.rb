class OauthController < ApplicationController
  
  APP_ID = "50532b96d93a4b7a7c000002"
  APP_SECRET = "9b5211aabfe615db0c35d6e2a25e33a39aea0991fc44b3760926cdb97ad651f3"
  VPSA_AUTHORIZATION_URL = "https://www.vpsa.com.br/apps/oauth/authorization"
  VPSA_TOKEN_URL = "https://www.vpsa.com.br/apps/oauth/token"
  
  def authorization
    oauth_params = {
      :response_type => :code,
      :app_id => APP_ID,
      :redirect_uri => oauth_callback_url
    }
    redirect_to VPSA_AUTHORIZATION_URL + "?" + oauth_params.to_query
  end
  
  def callback
    
    options = {
      :body => {
        :grant_type => :authorization_code, 
        :app_id => APP_ID, 
        :app_secret => APP_SECRET,
        :redirect_uri => oauth_callback_url,
        :code => params[:code]
      }.to_json,
      :headers => { 'Content-Type' => 'application/json' }
    }
    response = HTTParty.post(VPSA_TOKEN_URL, options)
    
    parse_response(response.parsed_response) if response.success?
       
    redirect_to root_path
  end
  
  def logout
    session[:usuario] = nil
    render root_path
  end

  private 
  
  def parse_response parsed_response
    session[:usuario] = {
      :access_token => parsed_response['access_token'],
      :expires_in => parsed_response['expires_in'],
      :refresh_token => parsed_response['refresh_token'],
      :id_terceiro => parsed_response['id_terceiro'],
      :nome_terceiro => parsed_response['nome_terceiro'],
      :cnpj_empresa => parsed_response['cnpj_empresa']
    }
  end
  
end
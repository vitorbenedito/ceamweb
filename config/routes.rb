Ceam::Application.routes.draw do
  resources :produtos

  resources :localizacaos
  
  resources :balancos

  match "/localizacaos/loadprodutos/:id" => "localizacaos#loadProdutos"
  
  match "/localizacaos/find/:descricao" => "localizacaos#find"

#  root :to => 'balancos#index'

end

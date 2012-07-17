Ceam::Application.routes.draw do
  
  root :to => 'balancos#index'
  
  resources :produtos

  resources :localizacaos
  
  resources :balancos

  match "/localizacaos/loadprodutos/:id" => "localizacaos#loadProdutos"
  
  match "/localizacaos/find/:descricao" => "localizacaos#find"

end

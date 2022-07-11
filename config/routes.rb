Rails.application.routes.draw do
	resources :clientes
	resources :customers_success
	root 'paginas#inicio'

	get '/criar_balanciamento', controller: 'paginas', action: 'criar_balanciamento'
end

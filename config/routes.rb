Rails.application.routes.draw do
	get 'welcome/index'

	resources :welcome
	namespace :api do
		namespace :v1 do
			resources :gamedatas
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

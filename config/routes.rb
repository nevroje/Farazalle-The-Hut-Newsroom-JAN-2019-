Rails.application.routes.draw do
	devise_for :users, controllers: {
		registrations: :registrations,
		confirmations: :confirmations
	}
	root controller: :articles, action: :index

	namespace :api do
    namespace :v1 do
      resources :articles, only: [:index], constraints: { format: 'json' }
		end
	end

	resources :articles, only: [:index, :show, :create, :new]
	resources :categories, only: [:show]

		namespace :staff_content do
			namespace :editor do
			resources :articles
		end
	end
end

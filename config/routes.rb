Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      scope 'categories' do
        get 'index', to: 'categories#index'
        get 'show/:id', to: 'categories#show'
        post 'create', to: 'categories#create'
        patch 'update/:id', to: 'categories#update'
        delete 'delete/:id', to: 'categories#delete'
      end
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end

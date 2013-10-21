Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :taxonomies do
      member do
        get :get_children
      end

      resources :taxons do
        resources :flash_sales, :controller => 'taxons/flash_sales'
        
        resources :products, :controller => 'taxons/products' do
          member do
            get :select
            delete :remove
          end
          collection do
            post :available
            post :batch_select
            get  :selected
          end
        end
      end
    end
    
    resources :products do
      resources :flash_sales, :controller => 'products/flash_sales' do
        collection do
          get :saleables
        end
      end
    end
  end
end

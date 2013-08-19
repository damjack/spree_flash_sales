Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :products do
      resources :flash_sales do
        collection do
          get :saleables
        end
      end
    end
  end
end

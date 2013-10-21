module Spree
  module Admin
    module Taxons
      class ProductsController < Spree::Admin::BaseController
        respond_to :html, :json, :js
  
        def selected
          @taxon = load_taxon
          @products = @taxon.products.order("spree_products.name ASC")

          respond_with(@products)
        end

        def available
          @taxon = load_taxon
    
          @products = params[:q].blank? ? [] : Spree::Product.where('lower(name) LIKE ?', "%#{params[:q].mb_chars.downcase}%").order("name ASC")
          @products.delete_if { |product| @taxon.products.include?(product) }

          respond_with(@products)
        end

        def remove
          @taxon = load_taxon
          
          @product = Spree::Product.find_by_permalink!(params[:id])
          
          @taxon.products.delete(@product)
          @taxon.save
          @products = @taxon.products.order("spree_products.name ASC")

          respond_with(@product) { |format| format.js { render_js_for_destroy } }
        end

        def select
          @taxon = load_taxon
          
          @product = Spree::Product.find_by_permalink!(params[:id])
          @taxon.products << @product
          @taxon.save
          @products = @taxon.products.order("spree_products.name ASC")

          respond_with(@products)
        end

        def batch_select
          @product = load_product
          @taxons = params[:taxon_ids].map{|id| Taxon.find(id)}.compact
          @product.taxons = @taxons
          @product.save
          redirect_to selected_admin_product_taxons_url(@product)
        end

        private

        def load_taxon
          Spree::Taxon.find params[:taxon_id]
        end
      end
    end
  end
end
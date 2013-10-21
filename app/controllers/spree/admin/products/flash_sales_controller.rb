# encoding: utf-8
module Spree
  module Admin
    module Products
      class FlashSalesController < ResourceController
        before_filter :load_data

        def saleables
          search = Spree::Product.search(:name_cont => params[:name])
          render :json => search.result.map(&:name)
        end

        protected
          def location_after_save
            admin_product_flash_sales_url(@product)
          end

          def load_data
            @product = Product.find_by_permalink(params[:product_id])
            @variants = @product.variants.collect do |variant|
              [variant.options_text, variant.id]
            end
            @variants.insert(0, [I18n.t(:all), 'All'])
          end
      end
    end
  end
end

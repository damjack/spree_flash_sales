# encoding: utf-8
module Spree
  module Admin
    module Taxons
      class FlashSalesController < ResourceController
        before_filter :load_data
        create.before :set_taxon
        update.before :set_taxon
        
        def set_taxon
          @flash_sale.taxon = @taxon
        end
        
        protected
          def location_after_save
            edit_admin_taxonomy_url(@taxon.taxonomy)
          end

          def load_data
            @taxon = Spree::Taxon.find(params[:taxon_id])
          end
      end
    end
  end
end

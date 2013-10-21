Spree::Admin::TaxonsController.class_eval do
  after_filter :save_flash_sale, :only => [:update]
  def edit
    @taxonomy = Spree::Taxonomy.find(params[:taxonomy_id])
    @taxon = @taxonomy.taxons.find(params[:id])
    
    @products = @taxon.products.order("spree_products.name ASC")
    @permalink_part = @taxon.permalink.split("/").last

    respond_with(:admin, @taxon) 
  end
  
  def save_flash_sale
    params[:product].each do |p|
      product = Spree::Product.find(p[:id])
      product.update_attribute(:flash_price_cent, p[:flash_price_cent])
    end
  end
end
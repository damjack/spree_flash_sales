Spree::Product.class_eval do
  has_many :flash_sales
  
  attr_accessible :flash_price_cent
end
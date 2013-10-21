Spree::Taxon.class_eval do
  has_many :flash_sales
  
  attr_accessible :flash_sales_attributes, :flash_sales
  
  accepts_nested_attributes_for :flash_sales
end
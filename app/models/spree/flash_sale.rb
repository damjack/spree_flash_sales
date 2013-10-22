# encoding: utf-8
class Spree::FlashSale < ActiveRecord::Base
  belongs_to :product
  belongs_to :taxon

  validates :price_cost, :presence => true, :if => :is_product
  validates :end_date, :presence => true
  validates :start_date, :presence => true

  attr_accessible :active, :end_date, :start_date, :count_on_hand, :price_cost,
                  :product_id, :product, :product_name

  scope :live, lambda { where("start_date <= :start_date AND end_date >= :end_date AND active = :active ", {:start_date => DateTime.now.in_time_zone, :end_date => DateTime.now.in_time_zone, :active => true}) }
  scope :is_taxon, lambda { where("taxon_id IS NOT NULL") }
  
  def live?
    return false if !self.active?
    self.start_date.in_time_zone <= DateTime.now.in_time_zone && self.end_date.in_time_zone >= DateTime.now.in_time_zone
  end
  
  def is_product
    self.taxon.blank?
  end
  
  def product_name
    product.try(:name)
  end

  def product_name=(name)
    self.product = Spree::Product.find_by_name(name) if name.present?
  end
end

module Spree
  BaseController.class_eval do
    helper 'spree/flash_sales'
  end
end

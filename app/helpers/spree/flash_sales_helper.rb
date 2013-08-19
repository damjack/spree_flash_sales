module Spree
  module FlashSalesHelper
    def countdown_format(fs)
      fs.end_date.strftime(t("spree.flash_sale.datetimepicker.strftime_format"))
    end

    def countdown_layout
      "{dn} Giorni {hnn}{sep}{mnn}{sep}{snn}"
    end
    
    def add_countdown(product)
      flash_sale = product.flash_sales.live.last rescue nil
      if flash_sale
        cont = content_tag(:span, "", :class => "flash-sale-countdown", 'data-countdown' => flash_sale.end_date.strftime(t("spree.flash_sale.datetimepicker.strftime_format")), 'data-layout' => countdown_layout)
      else
        cont = ""
      end
      
      return content_tag(:div, cont.html_safe, :class => "flash-sale-expires").html_safe
    end
  end
end
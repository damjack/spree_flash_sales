# coding: utf-8

Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "taxons_flash_sales_admin_tab",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs']",
                     :text => "<%= tab(:taxonomies, :label => 'taxonomies') %>")

Deface::Override.new(:name => "admin_flash_sales_list",
                    :virtual_path => "spree/admin/shared/_product_tabs",
                    :insert_bottom => "[data-hook='admin_product_tabs']",
                    :text => "
                    <li<%== 'class=active' if current == 'Flash Sales' %>>
                        <%= link_to t(:flash_sales), admin_product_flash_sales_url(@product) %>
                    </li>")

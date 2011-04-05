# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class DragOrderExtension < Radiant::Extension
  version "0.3.6"
  description "Radiant DragOrder allows you to reorder pages funly"
  url "http://github.com/gerrit/radiant-drag-order"
  
  def activate
    admin.pages.index.add :sitemap_head, "drag_order_header", :before=>"title_column_header"
    admin.pages.index.add :node, "drag_order", :before=>"title_column"
    admin.pages.index.add :top, "top"
    
    Page.send :include, DragOrder::PageExtensions
    Admin::PagesController.send :helper, DragOrder::PageHelper
    Admin::PagesController.send :include, DragOrder::PageControllerExtensions
    StandardTags.send :include, DragOrder::TagExtensions
  end
  
end
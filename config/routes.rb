ActionController::Routing::Routes.draw do |map|
  
  # Bucket routes
  map.with_options(:controller => 'admin/pages') do |page|
    page.page_move_to "admin/pages/:id/move_to/:rel/:pos/:copy", :action => "move_to"
  end    
  
end
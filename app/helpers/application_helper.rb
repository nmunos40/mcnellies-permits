module ApplicationHelper


def sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
end


def logo_url
	Tenant.current.logo
end

def bootstrap_class_for(flash_type)
 	case flash_type
  		when "success"
    		"alert-success"   # Green
  		when "error"
    		"alert-danger"    # Red
  		when "alert"
   			 "alert-warning"   # Yellow
  		when "notice"
    		"alert-info"      # Blue
  		else
    		flash_type.to_s
  	end
end


end
	

# Keep for report export
	# 	<ul class="nav nav-pills nav-stacked">
	# 	<li><%= link_to "Create New Permit", new_site_permit_path %></li>
	# 	<li><%= link_to "Export List to Excel", export_path(format: "xls")%></li>	
	# 	<li><%= link_to "Export List to CSV", export_path(format: "csv")%></li> 
	# </ul>
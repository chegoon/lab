module ApplicationHelper

	def num_diff(num1, num2, display_flag = true)

		if num1 && num2
			ret = (num1 - num2).to_i
		else
			return ""
		end

		if display_flag == true && ret > 0
			return " (+#{number_with_delimiter(ret)})"
		elsif display_flag == true && ret < 0
			return " (#{number_with_delimiter(ret)})"
		end
	end	

	def sortable(column, title = nil)
		title ||= column.titleize
    	css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    	direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    	link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end

	def truncate(text, len, tail = '..')
		if text.present?
			unpacked = text.unpack('U*') 
			unpacked.length > len ? unpacked[0..len-1].pack('U*') + tail : text
		end
	end	
end
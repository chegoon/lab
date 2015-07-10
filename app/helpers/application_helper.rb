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
end

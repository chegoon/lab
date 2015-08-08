class HomeController < ApplicationController
	helper_method :sort_column, :sort_direction
	
	def index
		@channels = Channel.where(joined: true).order(sort_column + ' ' + sort_direction).page(params[:page])
	end
	
	private
	def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end
    def sort_column
      Channel.column_names.include?(params[:sort]) ? params[:sort] : "subscriber_count"
    end
end

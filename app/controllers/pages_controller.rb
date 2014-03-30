class PagesController < ApplicationController
	def index
		params[:per_page] ||= 10
		params[:page]     ||= 1
		@topics = Topic.order('created_at DESC').paginate(:page => params[:page], :per_page => params[:per_page])
	end
	
end

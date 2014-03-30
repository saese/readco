class LinksController < ApplicationController

	def create
		@link = current_user.links.create(link_params)
		if @link.save
			redirect_to subtopic_path(@link.subtopic)
		end
	end


	def destroy
		@link = Link.where(:id => params[:id]).first
		@link.destroy
		redirect_to subtopic_path(@link.subtopic)
	end

	private
	def link_params
		params.require(:link).permit(:title, :url, :subtopic_id)
	end
end

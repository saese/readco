class LinksController < ApplicationController
	before_filter :authenticate_user!, :except => [:show]
	before_filter :correct_user, :only => [:destroy]

	def create
		@subtopic = Subtopic.where(:id=> params[:link][:subtopic_id]).first
		if @subtopic.user == current_user
			@link = current_user.links.create(link_params)
 			if @link.save
				redirect_to subtopic_path(@link.subtopic)
			end
		else
			redirect_to :root, :notice => "Not your subtopic frendo"
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

	def correct_user
		@link = Link.where(:id => params[:id]).first
		redirect_to :root unless @link.user == current_user
	end
end

class SubtopicsController < ApplicationController

	def create
		@subtopic = current_user.subtopics.create(subtopic_params)
		if @subtopic.save
			redirect_to subtopic_path(@subtopic)
		end
	end

	def show
		@subtopic = Subtopic.where(:id => params[:id]).first
		@link = Link.new
	end

	def edit
		@subtopic = Subtopic.where(:id => params[:id]).first
	end

	def update
		@subtopic = Subtopic.where(:id => params[:id]).first
		@subtopic.update_attributes(subtopic_params)
		if @subtopic.save
			redirect_to subtopic_path(@subtopic)
		end
	end

	def destroy
		@subtopic = Subtopic.where(:id => params[:id]).first
		@subtopic.destroy
		redirect_to topic_path(@subtopic.topic)
	end

	private
	def subtopic_params
		params.require(:subtopic).permit(:title, :description, :topic_id)
	end

end

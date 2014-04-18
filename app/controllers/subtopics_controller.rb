class SubtopicsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show]
	before_filter :correct_user, :only => [:update, :destroy]

	def create
		@topic = Topic.where(:id=> params[:subtopic][:topic_id]).first
		if @topic.user == current_user
			@subtopic = current_user.subtopics.create(subtopic_params)
 			if @subtopic.save
				redirect_to topic_path(@subtopic.topic)
			end
		else
			redirect_to :root, :notice => "Not your topic frendo"
		end
	end

	def show
		@subtopic = Subtopic.where(:id => params[:id]).first
		@link = Link.new
	end

	def edit
		@subtopic = Subtopic.where(:id => params[:id]).first
		@topic = @subtopic.topic

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

	def correct_user
		@subtopic = Subtopic.where(:id => params[:id]).first
		redirect_to :root unless current_user == @subtopic.user 
	end

end

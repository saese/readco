class TopicsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show]
	before_filter :correct_user, :only => [:update, :destroy]

	def new
		@topic = Topic.new
	end

	def create
		@topic = current_user.topics.create(topic_params)
		if @topic.save
			redirect_to topic_path(@topic)
		else
			render "new"
		end
	end

	def show
		@topic = Topic.where(:id => params[:id]).first
		@subtopic = Subtopic.new
	end

	def edit
		@topic = Topic.where(:id => params[:id]).first
	end

	def update
		@topic = Topic.where(:id => params[:id]).first
		@topic.update_attributes(topic_params)
		if @topic.save
			redirect_to topic_path(@topic)
		end
	end

	def destroy
		@topic = Topic.where(:id => params[:id]).first
		@topic.destroy
		redirect_to :root
	end

	private
	def topic_params
		params.require(:topic).permit(:title, :description)
	end

	def correct_user
		@topic = Topic.where(:id => params[:id]).first
		redirect_to :root unless @topic.user == current_user
	end
end

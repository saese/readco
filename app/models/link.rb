class Link < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	belongs_to :subtopic
	validates :title, presence: true
	validates :url, presence: true
end

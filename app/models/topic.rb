class Topic < ActiveRecord::Base
	belongs_to :user
	has_many :subtopics
	validates :title, presence: true
	validates :description, presence: true
end


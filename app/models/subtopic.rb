class Subtopic < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	has_many :links
	validates :title, presence: true
	validates :description, presence: true
end

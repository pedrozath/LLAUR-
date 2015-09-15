class Question < ActiveRecord::Base
	attr_accessible :title, :answer
	validate :title, :presence
	validate :answer, :presence
end

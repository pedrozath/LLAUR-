class Category < ActiveRecord::Base
	has_many :photos
	attr_accessible :title
end

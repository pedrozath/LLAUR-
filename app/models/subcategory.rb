class Subcategory < ActiveRecord::Base
	attr_accessible :title, :category_id
	belongs_to :category
	has_many :photos
end

class Photo < ActiveRecord::Base
	belongs_to :category

	attr_accessible :subcategory_id, :image, 
	:new_category, :new_subcategory, :category, 
	:subcategory, :description
	
	mount_uploader :image, ImageUploader

	attr_accessor :category
	attr_accessor :new_category
	attr_accessor :new_subcategory

	validate :image, :presence

end

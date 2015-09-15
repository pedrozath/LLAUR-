class Photo < ActiveRecord::Base
	belongs_to :subcategory

	attr_accessible :subcategory_id, :image, 
	:new_category, :new_subcategory, :category, 
	:subcategory, :description
	
	mount_uploader :image, ImageUploader

	attr_accessor :category
	attr_accessor :new_category
	attr_accessor :new_subcategory

	validate :subcategory_id, :presence
	validate :image, :presence

	before_validation :create_new_subcategory

	def create_new_subcategory
		unless self.new_category.blank?
			self.category = Category.find_or_create_by(title: self.new_category) 
			self.category = self.category.id
		end

		unless self.new_subcategory.blank?
			self.subcategory = Subcategory.find_or_create_by(title: self.new_subcategory, category_id: self.category)
		end
	end

end

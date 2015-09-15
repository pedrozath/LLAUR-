class Subcategory < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	attr_accessible :title, :category_id
	belongs_to :category
	has_many :photos
end

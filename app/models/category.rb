class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	has_many :photos
	attr_accessible :title
end

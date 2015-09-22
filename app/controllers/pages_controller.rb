class PagesController < ApplicationController
	def index
		@content_class = "full"
		@logo = "logo-cia-das-capas-negativo.png"
        @categories = Category.all
	end
end
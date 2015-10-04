class PagesController < ApplicationController
	def index
		@content_class = "full"
		@logo = "logo-cia-das-capas-negativo.png"
        @categories = Category.all
	end
	def zoho
		render text: "1443981302769"
	end
end
class CategoriesController < ApplicationController
	def index
		render partial: "category", collection: Category.all
	end
	def destroy
		Category.find(params[:id]).destroy
		render nothing: true
	end
	def create
		Category.create params[:category]
		redirect_to "/produtos"
	end
end
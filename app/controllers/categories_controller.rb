class CategoriesController < ApplicationController
	def index
		render partial: "category", collection: Category.all
	end
	def update
		e = Category.find params["id"]
		e.update_attribute params["field"], params["value"]
		e.save
		render nothing: true, status: 200
	end
	def destroy
		Category.find(params[:id]).destroy
		render nothing: true
	end
	def create
		Category.create params[:category]
		redirect_to "/"
	end
end
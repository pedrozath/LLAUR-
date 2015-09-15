class PhotosController < ApplicationController
	def create
		p = Photo.create params[:photo]
		p.image = params["file"]
		p.save
		render text: "tudo certo!"
	end

	def update
		@photo = Photo.find(params[:id])
		@photo.update_attributes params[:photo]
		redirect_to @photo
	end

	def index
		@current_page = "produtos"
		@photos = if params[:subcategory_id]
				subcategory = Subcategory.friendly.find(params[:subcategory_id])
				@title = "Capas de sofás em "+subcategory.title
				subcategory.photos
			elsif params[:category_id]
				Category.friendly.find(params[:category_id]).photos
			else
				Photo.all
		end
		request.xhr? ? render(partial: "photo", collection: Photo.all) : render
	end

	def show
		@current_page = "produtos"
		@photo = Photo.find(params[:id])
		@photos = @photo.subcategory.category.photos
		@open_graph_data = [
			{title: "#{@photo.subcategory.category.title} / #{@photo.subcategory.title}"},
			{image: @photo.image_url(:medium)},
			{type: "website"},
			{url: request.url}
		]
	end

	def destroy
		Photo.find(params[:id]).destroy
		render partial: "photo", collection: Photo.all
	end
end
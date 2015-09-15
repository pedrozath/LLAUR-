# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

	# Include RMagick or MiniMagick support:
	# include CarrierWave::RMagick
	include CarrierWave::MiniMagick

	# Choose what kind of storage to use for this uploader:
	# storage :file
	storage :fog

	# Override the directory where uploaded files will be stored.
	# This is a sensible default for uploaders that are meant to be mounted:
	def store_dir
		"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end

	version :large do
		resize_to_fit 1200, 1000
	end
	version :big do
		resize_to_fit 400, 1000
	end
	version :medium do
		resize_to_fit 400, 650
	end
	version :small do
		resize_to_fit 200, 150
	end
end

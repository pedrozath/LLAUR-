class ChangeCategoryIdFromSubcategoriesToInteger < ActiveRecord::Migration
  def change
  	remove_column :subcategories, :category_id
  	add_column :subcategories, :category_id, :integer
  end
end

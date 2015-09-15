class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :title
      t.string :category_id

      t.timestamps
    end
   	remove_column :photos, :category_id
   	add_column :photos, :subcategory_id, :integer
  end
end

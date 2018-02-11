class CreateCategoryRecipes < ActiveRecord::Migration[4.2]
  def change
    create_table :category_recipes do |t|
      t.integer :category_id
      t.integer :recipe_id
    end
  end
end

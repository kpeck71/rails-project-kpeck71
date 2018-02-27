class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :category_recipes
  has_many :categories, through: :category_recipes

  def ingredient_attributes=(ingredient_attribute)
    ingredient_attributes.values.each do |ingredient_attribute|
      recipe = Recipe.find_or_create_by(ingredient_attribute)
      self.ingredients << ingredient
    end
  end

end

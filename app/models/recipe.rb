class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :category_recipes
  has_many :categories, through: :category_recipes
  validates :ingredients, presence: true

  def ingredient_attributes=(ingredient_attribute)
    ingredient_attributes.values.each do |ingredient_attribute|
      recipe = Recipe.find_or_create_by(ingredient_attribute)
      self.ingredients << ingredient
    end
  end

end

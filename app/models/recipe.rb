class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :category_recipes
  has_many :categories, through: :category_recipes
  validates :ingredients, presence: true

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredient_attribute|
       ingredient = Ingredient.find_or_create_by(ingredient_attribute)
       self.ingredients.build(ingredient_attribute)
    end
  end
#
# On this form you would have a series of fields named
# recipe[ingredient_attributes][0][name] and
# recipe[ingredient_attributes][0][description] which would write
# to the recipe model through a method ingredient_attributes=.
# This method cannot be provided via the accepts_nested_attributes_for
# macro because the custom writer would be responsible for finding or
# creating a recipe by name and then creating the row in the join model
# recipe_ingredients with the recipe_id, the ingredient_id, and the
# description from the form.

end

#
# class Post < ActiveRecord::Base
#   has_many :post_categories
#   has_many :categories, through: :post_categories
#
#
#   def categories_attributes=(category_attributes)
#     category_attributes.values.each do |category_attribute|
#       category = Category.find_or_create_by(category_attribute)
#       self.post_categories.build(category: category)
#     end
#   end
#
# end

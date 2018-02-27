class Category < ActiveRecord::Base
  has_many :category_recipes
  has_many :recipes, through: :category_recipes
end

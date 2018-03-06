class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    5.times { @recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    raise @recipe.inspect

  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, category_ids:[], ingredient_attributes: [:id, :name, :description])
    end

end

class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    10.times { @recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)

  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, ingredient_attributes: [:id, :name, :description])
    end

end

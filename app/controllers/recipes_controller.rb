class RecipesController < ApplicationController

  def new
    #giving my form an AR instance to wrap around so my form knows which model I'm building this form for
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    raise @recipe.inspect

  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :category_ids => [], :ingredients_attributes =>[:name, :description])
    end

end

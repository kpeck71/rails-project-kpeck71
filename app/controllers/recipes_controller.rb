class RecipesController < ApplicationController
before_action :authenticate_user!

  def new
    #giving my form an AR instance to wrap around so my form knows which model I'm building this form for
    @recipe = Recipe.new
    5.times{@recipe.ingredients.build} #build is initializing new record from relation
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if params[:recipe][:categories]
      category = Category.find_or_create_by(name: params[:recipe][:categories])
      @recipe.categories << category
    end
    raise @recipe.inspect
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      #error message?
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :user_id, :category_ids => [], :ingredients_attributes =>[:name, :description])
    end

end

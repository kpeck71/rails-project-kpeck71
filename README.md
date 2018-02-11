# Rails Portfolio Project - Content Management System

## has_many, belongs_to, has_many :through
http://guides.rubyonrails.org/association_basics.html#the-has-one-through-association

CategoryRecipe
:recipe_id
:category_id

Category
:name

Recipe
:name
:ingredients
:user_id

Users
:name
:email
:password_digest

## validations to prevent invalid data
http://guides.rubyonrails.org/form_helpers.html#preventing-empty-records

## at least one class-level AR scope method (e.g. @user.tasks.overdue)
  To some extent these class scopes can be added to power a specific individual feature, such as "My Overdue Tasks" in a TODO application, scoping all tasks for the user by a datetime scope for overdue items, @user.tasks.overdue. Reports make for a good usage of class scopes, such as "Most Valuable Cart by Customer" where the code would implement a Cart.most_valuable and Cart.by_customer which could be combined as Cart.most_valuable.by_customer(@customer)

@user.recipes.user_favorite - most-often cooked by a user
@category.recipes.all_favorite - most-often cooked by all users
  Include a method like Add to Cart where you cook it and click "I Cooked This" ? Keep a count of how many users cooked it?

## nested form with custom attribute writer (NO accepts_nested_attributes_for macro)
  An example of this would be a New Recipe form that allowed you to add ingredients that are unique across recipes (thereby requiring a join model, or imagine being able to see all recipes that include Chicken), along with a quantity or description of the ingredient in the recipe. On this form you would have a series of fields named recipe[ingredient_attributes][0][name] and recipe[ingredient_attributes][0][description] which would write to the recipe model through a method ingredient_attributes=. This method cannot be provided via the accepts_nested_attributes_for macro because the custom writer would be responsible for finding or creating a recipe by name and then creating the row in the join model recipe_ingredients with the recipe_id, the ingredient_id, and the description from the form.
  http://guides.rubyonrails.org/form_helpers.html#nested-forms

  def ingredient_attributes=(ingredient_attribute)
    ingredient_attributes.values.each do |ingredient_attribute|
      category = Category.find_or_create_by(ingredient_attribute)
      self.ingredients << ingredient
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], ingredient_attributes: [:name])
  end

  <%= form_for post do |f| %>
  <%= f.label "Title" %>
  <%= f.text_field :title %>
  <%= f.label "Content" %>
  <%= f.text_area :content %>
  <%= f.collection_check_boxes :category_ids, Category.all, :id, :name %>
  <%= f.fields_for :categories, post.categories.build do |categories_fields| %>
    <%= categories_fields.text_field :name %>
  <% end %>
  <%= f.submit %>
<% end %>

## user authentication (can use Devise but may want to build your own)
## 3rd party login (Facebook, Twitter, etc) - Omniauth
## Newsted resource (eg. /profiles/1/photos/new)
  /recipes/1/photos/new
  Use images from Food52 (Not) Recipes?

## Display validation errors - field should have fields_with_errors class (video on this)
http://guides.rubyonrails.org/action_controller_overview.html#the-flash

https://apidock.com/rails/ActionView/Helpers/FormBuilder/fields_for
## DRY - partials, helper methods
## NO scaffolding

#Ideas
Build off Sinatra project with Recipe manager
(Too boring?)

Library of resources
-Rupaul Drag Race

  What is the has_many through - tour dates?
  Queen has many tour_dates through :tours
  Mother is an attribute of a queen, like an admin
    -different abilities - what should those be?
  Queen
  Tour
  belongs_to :queen
  belongs_to  :venue ?

  Signature song
  Type (Comedy queen, fishy queen, )
  Season

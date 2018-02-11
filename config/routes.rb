Rails.application.routes.draw do

  post 'recipes/:id/cooked', to: 'recipes#cooked', as: 'cooked'

end

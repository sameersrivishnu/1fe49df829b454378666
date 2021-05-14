Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
   post "sudoku" ,to: "sudoku#create"
  end	
end

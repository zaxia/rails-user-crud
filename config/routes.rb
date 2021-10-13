Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "/login", to: "home#login"
  post "/connect", to: "home#connect"
  get "/test_calcul", to: "home#test_calcul"

  get "/user/list", to: "user#list"
  get "/user/add", to: "user#add"
  post "/user/save", to: "user#save"
  get "/user/edit", to: "user#edit"
  post "/user/update", to: "user#update"
  get "/user/delete", to: "user#delete"
  get "/user/checkUsername", to: "user#checkUsername"
end

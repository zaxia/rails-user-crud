Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #Home
  root "home#index"
  get "/login", to: "home#login"
  post "/connect", to: "home#connect"

  #Users
  get "/user/list", to: "user#list"
  get "/user/add", to: "user#add"
  post "/user/save", to: "user#save"
  get "/user/edit", to: "user#edit"
  post "/user/update", to: "user#update"
  get "/user/delete", to: "user#delete"
  get "/user/checkUsername", to: "user#checkUsername"
  get "/disconnect", to: "user#disconnect"

  #Chat
  get "/chat", to: "chat#page"
  post "/chat/send", to: "chat#send_message"

  #Email
  get "/email", to: "email#page"
  post "/email/send", to: "email#send_mail"

  #Calculation
  get "/calculation", to: "calculation#page"
  get "/calculation/test", to: "calculation#test"

  #Solidity
  get "/solidity", to: "solidity#page"
  get "/solidity/test", to: "solidity#test"

  #Websocket
  mount ActionCable.server => '/chat_websocket'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/blogs/new'
  #blogs/newをblogs/:idの下に書くと、newがidと勘違いされるため、上に書かないとダメ！！
  post '/blogs' => 'blogs#create'
  get '/blogs' => 'blogs#index'
  get '/blogs/:id' => 'blogs#show', as: 'blog'
end

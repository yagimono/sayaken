Rails.application.routes.draw do

  get 'blogs/index'
  get 'blogs', to: 'blogs#index'
  get 'blogs/:page', to: 'blogs#index'

  get 'blogs/genre/:id', to: 'blogs#genre'
  get 'blogs/genre/:id/:page', to: 'blogs#genre'

  get 'blogs/show/:id', to: 'blogs#show'


  get 'blogconfigs/index'
  get 'blogconfigs', to: 'blogconfigs#index'

  get 'blogconfigs/edit'
  patch 'blogconfigs/edit'


  get 'bloggenres/index'
  get 'bloggenres', to: 'bloggenres#index'

  get 'bloggenres/add'
  post 'bloggenres/add'

  get 'bloggenres/:id', to:'bloggenres#edit'
  patch 'bloggenres/:id', to:'bloggenres#edit'


  get 'blogposts/index'
  get 'blogposts', to: 'blogposts#index'

  get 'blogposts/add'
  post 'blogposts/add'

  get 'blogposts/:id', to:'blogposts#edit'
  patch 'blogposts/:id', to:'blogposts#edit'

  get 'blogposts/delete/:id', to: 'blogposts#delete'
  post 'blogposts/delete', to: 'blogposts#delete'
  post 'blogposts/delete/:id', to: 'blogposts#delete'


  root 'sample#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

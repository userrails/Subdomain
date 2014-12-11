require "subdomain"

Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }
  
   resources :homes do
      collection do
         get :contact
      end
   end
   #this line match the default root path when domain present and will check in server
   #match '/', to: 'homes#index', constraints: { subdomain: 'www' }, via: [:get]
   #this line works for the subdomain and authenticated user
   #match '', to: 'products#index', constraints: { subdomain: /.+/ }, via: [:get]
   #this is for default home page
   #root "homes#index", :conditions => {:host => "edupdu.local:3000"}


constraints(Subdomain) do
   resources :products
   resources :customers
  #match '/' => 'products#index', via: [:get]
end

root "homes#index"

end
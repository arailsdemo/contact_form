Rails.application.routes.draw do
  get "contact", :to => 'contact_form/contact#new', :as => 'new_contact_form'
  post 'contact', :to => 'contact_form/contact#create', :as => 'contact_form'
end

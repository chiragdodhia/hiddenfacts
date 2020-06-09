Rails.application.routes.draw do
  scope "(:locale)" do
    post 'contacts' => "contacts#create"
    root 'contacts#contact', as: 'root', via: :all
    get "(:any)" => "contacts#contact", :as => "contact_info"
  end
end
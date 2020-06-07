Rails.application.routes.draw do
  scope "(:locale)" do
    resources :contacts
    get 'contact' => "contacts#contact", :as => "contact_ajackus"
    root 'contacts#contact', as: 'root', via: :all
  end
end

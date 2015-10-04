Ciadascapas::Application.routes.draw do
	get "zohoverify/verifyforzoho.html", to: "pages#zoho"
	get "/admin", to: "sessions#new"
	post "/admin", to: "sessions#create"
	get "/logout", to: "sessions#destroy"

	get "/webmail" => redirect("http://mail.google.com/a/capasparasofa.com.br")
	get "questions/index"
	root to: "pages#index"
	get "/produtos" => "photos#index"
	get "/localizacao" => "pages#localizacao"
	get "/capas-para-sofa", to: redirect("/capas-para-sofa/fotos")
	
	resources :questions, path: "duvidas"
	resources :contacts, path: "contato"
	resources :photos, path: "fotos"


	resources :categories, path: "" do
		resources :photos, path: "fotos"
		resources :subcategories, path: "tipos" do
			resources :photos, path: "fotos"
		end
	end

end
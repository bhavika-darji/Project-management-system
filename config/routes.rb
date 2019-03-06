Rails.application.routes.draw do
	resources :logins , :projects, :employees, :clients, :technologies
	post 'sessions/create'
  get 'sessions/destroy'
end

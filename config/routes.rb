Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'amp', controller: "camaleon_cms/frontend" do
  	get '*unmatched_route', :to => 'application#render_404'
  end
end

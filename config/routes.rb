Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :v1, constrains: ApiVersion.new('v1', true) do
    resources :palindromes do
      get   '/palindromes', to: 'palindromes#index'
      post  '/palindromes', to: 'palindromes#evaluate'
    end
  end

  get '*path' => redirect('/palindromes')
end

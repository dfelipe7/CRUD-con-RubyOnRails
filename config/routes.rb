Rails.application.routes.draw do
# resources :estudiantes genera automáticamente index, show, new, create, edit, update, destroy.
  resources :estudiantes
  resources :cursos
  resources :matriculas, only: [:index, :new, :create, :destroy, :edit, :update]
  root "home#index"   # Página inicial será de estaditicas
end


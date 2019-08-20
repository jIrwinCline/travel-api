Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      devise_for :users,
      path: '',
      path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
      controllers: {
        sessions: 'sessions',
        registrations: 'registrations'
      }
      resources :places do
        resources :reviews
      end
    end
  end
end

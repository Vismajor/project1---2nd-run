Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  resources :friendships
  
  root to: 'posts#index'
  resources :posts do 
    resources :comments
  end
  resources :activities

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations do
      member do
        post :reply
        post :trash
        post :untrash
      end
    end

end

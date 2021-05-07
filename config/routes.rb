Rails.application.routes.draw do
  namespace :champions do
    scope module: :admin, path: 'admin' do
      get 'load_all_champions', to: 'champions#load_all_champions'
      post 'create_champion', to: 'champions#create_champions'
      delete 'delete_champion/:id', to: 'champions#delete_champions'
      patch 'update_champion/:id', to: 'champions#update_champions'
    end

    scope module: :user, path: 'user' do
      get 'find_champion_by_name/:name', to: 'champions#find_champion_by_name'
      post 'champion_adquirido', to: 'champions#champion_adquirido'
      get 'load_champions_adquiridos', to: 'champions#load_champions_adquiridos'
      get 'load_champion_adquirido_by_name/:name', to: 'champions#load_champion_adquirido_by_name'
    end

  end
end


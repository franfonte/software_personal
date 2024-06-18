# frozen_string_literal: true

Rails.application.routes.draw do
  # Rutas definidas por device
  get 'render/index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Tutorial
  resources :rooms do
    resources :messages
  end
  
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  get 'user/:id', to: 'users#show', as: 'user'


  # Ruta Root principal
  root 'render#index'

  # Render Controller
  get 'mi_perfil', to: 'render#mi_perfil', as: :mi_perfil
  get 'inicio', to: 'render#inicio', as: :inicio
  get 'reclamos', to: 'render#reclamos', as: :reclamos
  get 'crear_reclamo', to: 'render#crear_reclamo', as: :crear_reclamo
  
  # Helper resources
  resources :actividads
  resources :mensajes
  resources :solicituds
  resources :resenas

  # Actividads Controller
  get 'mis_actividades', to: 'actividads#mis_actividades', as: :mis_actividades
  get 'index_suscrito', to: 'actividads#index_suscrito', as: :index_suscrito
  get 'actividad/:id/participantes', to: 'actividads#participantes', as: :participantes
  post 'actividad/participante/:id', to: 'actividads#eliminar_participante', as: :eliminar_participante
  

  # Solicituds Controller
  get 'aceptar_solicitudes/:actividad_id', to: 'solicituds#aceptar_solicitudes', as: :aceptar_solicitudes
  post 'aceptar/:id', to: 'solicituds#aceptar', as: :aceptar
  post 'solicitud_externa/:id', to: 'solicituds#eliminar_solicitud_externa', as: :eliminar_solicitud_externa


  # Resenas Controller
  get 'resena_creada', to: 'resenas#resena_creada', as: :resena_creada
  get 'resenas/index/:actividad_id', to: 'resenas#index', as: :index_resena_id_act
  get 'resenas/new/:actividad_id', to: 'resenas#new', as: :new_resena_id_act
  get 'resenas/index_propio/:actividad_id', to: 'resenas#index_mi_actividad', as: :index_mi_resena_id_act
  delete 'resenas/eliminar/:id', to: 'resenas#destroy_de_mi_actividad', as: :eliminar

  # Administradores Controller
  get 'admin/actividades', to: 'users/admins#actividades', as: :admin_actividades
  get 'admin/resenas', to: 'users/admins#resenas', as: :admin_resenas
  get 'admin/solicitudes', to: 'users/admins#solicitudes', as: :admin_solicitudes
  get 'admin/rooms', to: 'users/admins#rooms', as: :admin_rooms
  get 'admin/usuarios', to: 'users/admins#usuarios', as: :admin_usuarios
  get 'admin/:user_id', to: 'users/admins#update', as: :admin
  delete 'admin/:user_id', to: 'users/admins#eliminar_usuario', as: :admin_eliminar_usuario

  # Named Route Helper Methods for Resourceful Routes:
  #
  # actividads_path               => GET    /actividads           => Retrieves a list of all activities.
  # actividad_path(:id)           => GET    /actividads/:id       => Retrieves a specific activity by its ID.
  # new_actividad_path            => GET    /actividads/new       => Renders a form to create a new activity.
  # actividads_path               => POST   /actividads           => Creates a new activity.
  # edit_actividad_path(:id)      => GET    /actividads/:id/edit  => Renders a form to edit an existing activity.
  # (:idactividad_path)           => PATCH/PUT /actividads/:id   => Updates an existing activity.
  # actividad_path(:id)           => DELETE /actividads/:id      => Deletes an existing activity.
  #

end

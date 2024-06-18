# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(_resource)
    inicio_path # Redirige al usuario a la página de perfil después de iniciar sesión
  end

  def after_sign_up_path_for(_resource)
    inicio_path # Redirige al usuario a la página de perfil después de registrarse
  end
end

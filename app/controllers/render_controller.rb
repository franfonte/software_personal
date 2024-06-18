# frozen_string_literal: true

class RenderController < ApplicationController
  def index; end
  
  # Nuevas views
  def crear_editar_grupo; end
  def explorar; end
  def mi_perfil; end
  def reclamos; end

  def crear_reclamo
    UserMailer.reclamo(current_user, params[:tipo_de_reclamo], params[:descripcion]).deliver_later
    redirect_to reclamos_path, notice: "Tu reclamo de tipo #{params[:tipo_de_reclamo]} se creó correctamente"
  end

end
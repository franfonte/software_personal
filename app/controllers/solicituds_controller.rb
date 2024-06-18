class SolicitudsController < ApplicationController
  def index
  end

  def aceptar_solicitudes
    @actividad_id = params[:actividad_id].to_i
  end


  def aceptar
    @solicitud = Solicitud.find(params[:id].to_i)
    if @solicitud.update(estado: true)
      redirect_to aceptar_solicitudes_path(@solicitud.actividad_id), notice: "Solicitud aceptada"
      @subject = "El usuario #{current_user.name} acepto tu solicitud para su actividad #{Actividad.find(@solicitud.actividad_id).titulo}"
      @actividad = Actividad.find(@solicitud.actividad_id)
      UserMailer.aceptado(User.find(@solicitud.user_id), @subject, @actividad).deliver_later
    else
      render :aceptar_solicitudes, notice: "Solicitud NO aceptada"
    end
  end
  
  def show
  end
  
  def new
  end
  
  def create
    @solicitud = Solicitud.new(solicitud_params)
      if @solicitud.save
        redirect_to solicituds_path, 
                    notice: "Tu solicitud para "+Actividad.find(@solicitud.actividad_id).titulo+" se creo correctamente"
                    UserMailer.suscrito(current_user,"Tu solicitud para "+Actividad.find(@solicitud.actividad_id).titulo+" se creo correctamente", 
                                        Actividad.find(@solicitud.actividad_id)).deliver_later
      else
        render :index, status: :unprocessable_entity #Este error (si hubiera) no se muestra en el index por ahora
      end
  end

  def solicitud_params
    params.require(:solicitud).permit(:descripcion, :estado, :actividad_id, :user_id)
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @solicitud = Solicitud.find(params[:id])
      if @solicitud.destroy
        if current_user.id == @solicitud.user_id
          redirect_to solicituds_path, notice: "Solicitud eliminada"
        elsif current_user.id != @solicitud.user_id
          redirect_to admin_solicitudes_path, notice: "Solicitud eliminada por admin"
        end
      else
        render :index, status: :unprocessable_entity #Este error (si hubiera) no se muestra en el index por ahora
      end
  end

  def eliminar_solicitud_externa
    @solicitud = Solicitud.find(params[:id])
    if @solicitud.destroy
      redirect_to aceptar_solicitudes_path(@solicitud.actividad_id), notice: "Solicitud eliminada"
    else
      render :index, status: :unprocessable_entity #Este error (si hubiera) no se muestra en el index por ahora
    end
  end

end

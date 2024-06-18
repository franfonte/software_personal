class ActividadsController < ApplicationController
    
  def mis_actividades
  end

  def participantes
    @actividad_id = params[:id].to_i
  end

  def index_suscrito
  end
    
  def index
  end
  
  def show
  end
  
  def new
    @actividad = Actividad.new
  end
  
  def create
    @actividad = Actividad.new(actividad_params)
    if @actividad.save
      @chat = Room.new(name: "#{@actividad.id} #{@actividad.titulo}", actividad_id: @actividad.id)
      if @chat.save
        redirect_to mis_actividades_path, notice: "Tu actividad #{@actividad.titulo} se creo correctamente"
        UserMailer.actividad(current_user,"Tu actividad "+@actividad.titulo+" se creo correctamente", @actividad).deliver_later
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def actividad_params
    params.require(:actividad).permit(:titulo, :fecha, :valor, :user_id, :descripcion, :publica)
  end
  
  def edit
    @actividad = Actividad.find(params[:id])
  end
  
  def update
    @actividad = Actividad.find(params[:id])
    if @actividad.update(actividad_params)
      if current_user.id == @actividad.user_id
        redirect_to mis_actividades_path, notice: "Tu actividad "+@actividad.titulo+" se edito correctamente"
      elsif current_user.id != @actividad.user_id
        redirect_to admin_actividades_path, 
                    notice: "La actividad "+@actividad.titulo+" se edito correctamente por admin"
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @actividad = Actividad.find(params[:id])
    if @actividad.destroy
      if current_user.id == @actividad.user_id
        redirect_to mis_actividades_path, notice: "Tu actividad "+@actividad.titulo+" se elimino correctamente"
      elsif current_user.id != @actividad.user_id
        redirect_to admin_actividades_path, 
                    notice: "La actividad "+@actividad.titulo+" se elimino correctamente por admin"
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def eliminar_participante
    @solicitud = Solicitud.find(params[:id])
    if @solicitud.destroy
      redirect_to participantes_path(@solicitud.actividad_id), 
                  notice: "Participante "+User.find(@solicitud.user_id).name+" eliminado"
    else
      render :index, status: :unprocessable_entity #Este error (si hubiera) no se muestra en el index por ahora
    end
  end
    
end

class ResenasController < ApplicationController
  def index
    @actividad_id = params[:actividad_id].to_i
  end

  def index_mi_actividad
    @actividad_id = params[:actividad_id].to_i
  end
  
  def show
  end
  
  def new
    @actividad_id = params[:actividad_id].to_i
      @resena = Resena.new
  end
  
  def create
    @resena = Resena.new(resena_params)
      if @resena.save
        redirect_to index_resena_id_act_path(@resena.actividad_id), notice: "¡Reseña creada con éxito!"
      else
        render :new, status: :unprocessable_entity
      end
  end
    
  def resena_params
    params.require(:resena).permit(:calificacion, :contenido, :user_id, :actividad_id, :fecha)
  end

  def edit
    @resena = Resena.find(params[:id])
  end
  
  def update
    @resena = Resena.find(params[:id])
    if @resena.update(resena_params)
      if @resena.user_id == current_user.id
        redirect_to index_resena_id_act_path(@resena.actividad_id), notice: "Tu reseña se edito correctamente"
      elsif @resena.user_id != current_user.id
        redirect_to admin_resenas_path, notice: "La reseña se edito correctamente por admin"
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @resena = Resena.find(params[:id])
    if @resena.destroy
      if @resena.user_id == current_user.id
        redirect_to index_resena_id_act_path(@resena.actividad_id), notice: "Tu reseña se elimino correctamente"
      elsif @resena.user_id != current_user.id and current_user.admin
        redirect_to admin_resenas_path, notice: "La reseña se elimino correctamente por admin"    
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy_de_mi_actividad
    @resena = Resena.find(params[:id])
    if @resena.destroy
      redirect_to index_mi_resena_id_act_path(@resena.actividad_id), 
                  notice: "La reseña se elimino correctamente por el dueño de la actividad"
    else
      render :edit, status: :unprocessable_entity
    end
  end
end

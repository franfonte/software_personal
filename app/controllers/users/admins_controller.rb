class Users::AdminsController < ApplicationController

  def update
    @user = User.find(params[:user_id])
      if @user.admin
        if @user.update(admin: false)
          redirect_to admin_usuarios_path, notice: "Usuario: "+@user.name+" ya no es Administrador"
        end
      elsif not @user.admin
        if @user.update(admin: true)
          redirect_to admin_usuarios_path, notice: "Usuario: "+@user.name+" ahora es Administrador"
        end
      end
  end

  def eliminar_usuario
    @user = User.find(params[:user_id])
    if @user.destroy
      redirect_to admin_usuarios_path, notice: "El usuario "+@user.email+" se elimino correctamente por admin"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def actividades
  end


  def resenas
  end


  def solicitudes
  end


  def usuarios
  end

  def rooms
  end

end

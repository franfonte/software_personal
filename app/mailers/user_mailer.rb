class UserMailer < ApplicationMailer

  def reclamo(user, tipo, texto)
    @user = user
    @tipo = tipo
    @texto = texto
    mail(to: @user.email, subject: "Tu reclamo de tipo #{@tipo} se creo correctamente")
  end

  def actividad(user, sujeto, texto)
    @user = user
    @sujeto = sujeto
    @texto = texto
    mail(to: @user.email, subject: @sujeto)
  end

  def suscrito(user, sujeto, texto)
    @user = user
    @sujeto = sujeto
    @texto = texto
    mail(to: @user.email, subject: @sujeto)
  end

  def aceptado(user, sujeto, texto)
    @user = user
    @sujeto = sujeto
    @texto = texto
    mail(to: @user.email, subject: @sujeto)
  end

end

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    UserMailer.welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/actividad
  def actividad
    UserMailer.actividad
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/suscrito
  def suscrito
    UserMailer.suscrito
  end

end

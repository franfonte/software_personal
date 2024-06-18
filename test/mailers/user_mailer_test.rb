require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "reclamo" do
    user = users(:one)  # Asume que tienes usuarios válidos en tus fixtures o factories
    mail = UserMailer.reclamo(user, 'Tipo de Reclamo', 'Texto del reclamo')
    
    assert_equal "Tu reclamo de tipo Tipo de Reclamo se creo correctamente", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["no.reply.groups.groups@gmail.com"], mail.from
    assert_match "Texto del reclamo", mail.body.encoded  # Verifica el contenido real del correo
  end

  test "actividad" do
    user = users(:one)
    actividad = actividads(:one)
    mail = UserMailer.actividad(user, 'Asunto de Actividad', actividad)
    
    assert_equal "Asunto de Actividad", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["no.reply.groups.groups@gmail.com"], mail.from
    #assert_match "Suscrito a la actividad #{actividad.titulo}", mail.body.encoded  # Verifica el contenido real del correo
  end

  test "suscrito" do
    user = users(:one)
    actividad = actividads(:one)  # Asumiendo que tienes actividades válidas en tus fixtures o factories
    mail = UserMailer.suscrito(user, 'Asunto de Suscripción', actividad)
    
    assert_equal "Asunto de Suscripción", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["no.reply.groups.groups@gmail.com"], mail.from
    assert_match actividad.titulo, mail.body.encoded  # Verifica el contenido real del correo
  end

  test "aceptado" do
    user = users(:one)
    actividad = actividads(:one)  # Asumiendo que tienes actividades válidas en tus fixtures o factories
    mail = UserMailer.aceptado(user, 'Asunto de Aceptación', actividad)
    
    assert_equal "Asunto de Aceptación", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["no.reply.groups.groups@gmail.com"], mail.from
    assert_match actividad.titulo, mail.body.encoded  # Verifica el contenido real del correo
  end
end

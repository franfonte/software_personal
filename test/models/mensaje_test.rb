require "test_helper"

class MensajeTest < ActiveSupport::TestCase
  def setup
    user_data = users(:one).attributes.symbolize_keys
    @user = User.new(user_data)
    act_data = actividads(:one).attributes.symbolize_keys
    @actividad = Actividad.new(act_data)
  end


  test "should be valid with attributes" do
    mensaje_data = mensajes(:one).attributes.symbolize_keys
    mensaje = Mensaje.new(mensaje_data)
    assert mensaje.valid?
  end

  test "should not be valid without user" do
    mensaje_data = mensajes(:one).attributes.symbolize_keys
    mensaje = Mensaje.new(mensaje_data)
    mensaje.user = nil
    assert_not mensaje.valid?
  end

  test "should not be valid without actividad" do
    mensaje_data = mensajes(:one).attributes.symbolize_keys
    mensaje = Mensaje.new(mensaje_data)
    mensaje.actividad = nil
    assert_not mensaje.valid?
  end

  test "should be valid without fecha" do
    mensaje_data = mensajes(:one).attributes.symbolize_keys
    mensaje = Mensaje.new(mensaje_data)
    mensaje.fecha = nil
    assert mensaje.valid?
  end

  test "should be valid without contenido" do
    mensaje_data = mensajes(:one).attributes.symbolize_keys
    mensaje = Mensaje.new(mensaje_data)
    mensaje.contenido = nil
    assert mensaje.valid?
  end

end

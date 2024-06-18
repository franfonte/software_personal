require "test_helper"

class ResenaTest < ActiveSupport::TestCase
  def setup
    user_data = users(:one).attributes.symbolize_keys
    @user = User.new(user_data)
    act_data = actividads(:one).attributes.symbolize_keys
    @actividad = Actividad.new(act_data)
  end


  test "should be valid with attributes" do
    resena_data = resenas(:one).attributes.symbolize_keys
    resena = Resena.new(resena_data)
    assert resena.valid?
  end

  test "should not be valid without user" do 
    resena_data = resenas(:one).attributes.symbolize_keys
    resena = Resena.new(resena_data)
    resena.user = nil
    assert_not resena.valid?
  end

  test "should not be valid without actividad" do 
    resena_data = resenas(:one).attributes.symbolize_keys
    resena = Resena.new(resena_data)
    resena.actividad = nil
    assert_not resena.valid?
  end

  test "should not be valid without fecha" do 
    resena_data = resenas(:one).attributes.symbolize_keys
    resena = Resena.new(resena_data)
    resena.fecha = nil
    assert_not resena.valid?
  end

  test "should not be valid without contenido" do 
    resena_data = resenas(:one).attributes.symbolize_keys
    resena = Resena.new(resena_data)
    resena.contenido = nil
    assert_not resena.valid?
  end

  test "should not be valid without " do 
    resena_data = resenas(:one).attributes.symbolize_keys
    resena = Resena.new(resena_data)
    resena.calificacion = nil
    assert_not resena.valid?
  end

end

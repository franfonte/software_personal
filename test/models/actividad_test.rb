require "test_helper"

class ActividadTest < ActiveSupport::TestCase
  def setup
    user_data = users(:one).attributes.symbolize_keys
    @user = User.new(user_data)
  
  end

  test "should be valid with attributes" do
    act_data = actividads(:one).attributes.symbolize_keys
    actividad = Actividad.new(act_data)
    assert actividad.valid?
  end

  test "should not be valid without user" do
    act_data = actividads(:one).attributes.symbolize_keys
    actividad = Actividad.new(act_data)
    actividad.user = nil
    assert_not actividad.valid?
  end

  test "should not be valid without titulo" do
    act_data = actividads(:one).attributes.symbolize_keys
    actividad = Actividad.new(act_data)
    actividad.titulo = nil
    assert_not actividad.valid?
  end

  test "should not be valid without valor" do
    act_data = actividads(:one).attributes.symbolize_keys
    actividad = Actividad.new(act_data)
    actividad.valor = nil
    assert_not actividad.valid?
  end

  test "should not be valid without descripcion" do
    act_data = actividads(:one).attributes.symbolize_keys
    actividad = Actividad.new(act_data)
    actividad.descripcion = nil
    assert_not actividad.valid?
  end

  test "should be valid without publica" do
    act_data = actividads(:one).attributes.symbolize_keys
    actividad = Actividad.new(act_data)
    actividad.publica = nil
    assert actividad.valid?
  end  

  test "should be valid without calificacion_primedio" do
    act_data = actividads(:one).attributes.symbolize_keys
    actividad = Actividad.new(act_data)
    actividad.calificacion_promedio = nil
    assert actividad.valid?
  end  

end

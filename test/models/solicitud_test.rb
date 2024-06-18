require "test_helper"

class SolicitudTest < ActiveSupport::TestCase
  def setup
    user_data = users(:one).attributes.symbolize_keys
    @user = User.new(user_data)
    act_data = actividads(:one).attributes.symbolize_keys
    @actividad = Actividad.new(act_data)
  end


  test "should be valid with attributes" do
    solicitud_data = solicituds(:one).attributes.symbolize_keys
    solicitud = Solicitud.new(solicitud_data)
    assert solicitud.valid?
  end

  test "should not be valid without attribute user" do 
    solicitud_data = solicituds(:one).attributes.symbolize_keys
    solicitud = Solicitud.new(solicitud_data)
    solicitud.user = nil
    assert_not solicitud.valid?
  end 

  test "should not be valid without attribute actividad" do 
    solicitud_data = solicituds(:one).attributes.symbolize_keys
    solicitud = Solicitud.new(solicitud_data)
    solicitud.actividad = nil
    assert_not solicitud.valid?
  end 

  test "should be valid without attribute descripcion" do 
    solicitud_data = solicituds(:one).attributes.symbolize_keys
    solicitud = Solicitud.new(solicitud_data)
    solicitud.descripcion = nil
    assert solicitud.valid?
  end

  test "should be valid without attribute fecha" do 
    solicitud_data = solicituds(:one).attributes.symbolize_keys
    solicitud = Solicitud.new(solicitud_data)
    solicitud.fecha = nil
    assert solicitud.valid?
  end

  test "should be valid without attribute estado" do 
    solicitud_data = solicituds(:one).attributes.symbolize_keys
    solicitud = Solicitud.new(solicitud_data)
    solicitud.estado = nil
    assert solicitud.valid?
  end

end

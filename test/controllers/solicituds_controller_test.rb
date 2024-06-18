require "test_helper"

class SolicitudsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @solicitud = solicituds(:one)
    @actividad = actividads(:one)
    @user = users(:one)
    @admin = users(:admin)
    sign_in @user
  end 


  test "should get index" do
    get solicituds_path
    assert_response :success
  end


  test "should get aceptar_solicitudes" do
    get aceptar_solicitudes_path(actividad_id: @actividad.id)
    assert_response :success
    assert_equal @actividad.id, assigns(:actividad_id)
    '''assert_redirected_to aceptar_solicitudes_path(@actividad.id)
    assert_response :success
    assert_equal "Solicitud aceptada", flash[:notice]'''
  end

  test "should accept solicitud" do
    assert_difference('Solicitud.count', 0) do
      post aceptar_path(@solicitud.id), params: { id: @solicitud.id }
    end
    assert_redirected_to aceptar_solicitudes_path(@solicitud.actividad_id)
    assert_equal "Solicitud aceptada", flash[:notice]
  end

  test "should show solicitud" do
    get solicitud_url(@solicitud)
    assert_response :success
  end
  
  test "should create solicitud" do
    assert_difference('Solicitud.count') do
      post solicituds_path, params: { solicitud: { descripcion: "Descripción de la solicitud", estado: false, actividad_id: @actividad.id, user_id: @user.id } }
    end
    assert_redirected_to solicituds_path
    assert_equal "Tu solicitud para MyString se creo correctamente", flash[:notice]
    assert_enqueued_jobs 1  # Verificar que se encoló un correo
  end

  test "should render index on create failure" do
    post solicituds_url, params: { solicitud: { descripcion: "", actividad_id: 1, user_id: @user.id } }
    assert_response :unprocessable_entity
  end

  test "should destroy solicitud externa" do
    post eliminar_solicitud_externa_path(id: @solicitud.id)
    assert_redirected_to aceptar_solicitudes_path(@solicitud.actividad_id)
    assert_equal "Solicitud eliminada", flash[:notice]
  end

  test "should destroy solicitud" do
    assert_difference('Solicitud.count', -1) do
      delete solicitud_url(@solicitud)
    end
    assert_redirected_to solicituds_path
    assert_equal "Solicitud eliminada", flash[:notice]
  end

  test "should destroy solicitud as admin" do
    sign_in @admin
    assert_difference('Solicitud.count', -1) do
      delete solicitud_url(@solicitud)
    end
    assert_redirected_to admin_solicitudes_path
    assert_equal "Solicitud eliminada por admin", flash[:notice]
  end

end 

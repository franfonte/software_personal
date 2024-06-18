require "test_helper"


class ActividadsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  setup do
    @user = users(:one)
      @admin = users(:admin)
      @actividad_one = actividads(:one)
      sign_in @user
  end
    
  test "should get new" do
    get new_actividad_path
      assert_response :success
      assert_not_nil assigns(:actividad)
  end

  test "should get mis_actividades" do
    get mis_actividades_path
      assert_response :success
  end

  test 'should get index_suscrito' do
    get index_suscrito_path
      assert_response :success
  end

  test "should create actividad" do
    assert_difference('Actividad.count') do
      post actividads_path, 
           params: { actividad: { titulo: "Nueva Actividad", fecha: DateTime.now, valor: 10, descripcion: "Descripción de la nueva actividad", user_id: @actividad_one.user_id, publica: true } }
    end
  
      assert_redirected_to mis_actividades_path
      assert_equal "Tu actividad Nueva Actividad se creo correctamente", flash[:notice]
  end

  test "should not create actividad with invalid params" do
    assert_no_difference('Actividad.count') do
      post actividads_path, 
           params: { actividad: { titulo: nil, fecha: DateTime.now, valor: 10, descripcion: "Descripción de la nueva actividad", user_id: @actividad_one.user_id, publica: true } }
    end
  
      assert_response :unprocessable_entity
  end

  test "should get edit" do
    get edit_actividad_path(id: @actividad_one.id)
      assert_response :success
      assert_instance_of Actividad, assigns(:actividad)
  end

  test "should update actividad as owner" do
    patch actividad_path(id: @actividad_one.id), params: {actividad: { titulo: "Actividad Actualizada" } }
      assert_redirected_to mis_actividades_path
      assert_equal "Tu actividad Actividad Actualizada se edito correctamente", flash[:notice]
  end

  test "should not update actividad with invalid data" do
    patch actividad_path(@actividad_one), params: { actividad: { titulo: "", fecha: nil, valor: nil, user_id: nil, descripcion: "", publica: nil } }
      assert_template :edit
      assert_response :unprocessable_entity
  end
    
  test "should update actividad as admin" do
    sign_out @user
      sign_in @admin
      patch actividad_path(@actividad_one), params: { actividad: { titulo: "Updated Title", fecha: DateTime.now, valor: 20.0, user_id: @user.id, descripcion: "Updated description", publica: true } }
      assert_redirected_to admin_actividades_path
  end

  test "should destroy actividad" do
    assert_difference('Actividad.count', -1) do
      delete actividad_path(id: @actividad_one.id)
    end
      assert_redirected_to mis_actividades_path
      assert_equal "Tu actividad MyString se elimino correctamente", flash[:notice]
  end

  test "should destroy actividad as admin" do
    sign_out @user
      sign_in @admin
      assert_difference('Actividad.count', -1) do
        delete actividad_path(@actividad_one.id)
      end
      assert_redirected_to admin_actividades_path
  end

  test "should get eliminar_participante" do
    solicitud = solicituds(:one)
      post eliminar_participante_path(id: solicitud.id)
      assert_redirected_to participantes_path(solicitud.actividad_id)
      assert_match /Participante #{User.find(solicitud.user_id).name} eliminado/, flash[:notice]
  end

  test "should get participantes" do
    get participantes_path(id: @actividad_one.id )
      assert_response :success
      assert_equal @actividad_one.id, assigns(:actividad_id)
  end

end

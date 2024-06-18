require "test_helper"

class ResenasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @admin = users(:admin)
    @actividad = actividads(:one)
    @resena = resenas(:one)
    sign_in @user
  end

  test "should get index" do
    get resenas_path(actividad_id: @actividad.id)
    assert_response :success
    assert_not_nil assigns(:actividad_id)
  end

  test "should get index_mi_actividad" do
    get index_mi_resena_id_act_path(actividad_id: @actividad.id)
    assert_response :success
    assert_not_nil assigns(:actividad_id)
  end

  test "should get new" do
    get new_resena_path(actividad_id: @actividad.id)
    assert_response :success
    assert_not_nil assigns(:resena)
  end

  test "should create resena" do
    assert_difference('Resena.count') do
      post resenas_path, params: { resena: { calificacion: 4, contenido: "Buena actividad", user_id: @user.id, actividad_id: @actividad.id, fecha: DateTime.now } }
    end
    assert_redirected_to index_resena_id_act_path(@actividad.id)
  end

  test "should not create resena with invalid data" do
    assert_no_difference('Resena.count') do
      post resenas_path, params: { resena: { calificacion: nil, contenido: "", user_id: nil, actividad_id: nil, fecha: nil } }
    end
    assert_template :new
    assert_response :unprocessable_entity
  end

  test "should show resena" do
    get resena_path(@resena)
    assert_response :success
  end

  test "should get edit" do
    get edit_resena_path(@resena)
    assert_response :success
    assert_not_nil assigns(:resena)
  end

  test "should update resena" do
    patch resena_path(@resena), params: { resena: { calificacion: 4, contenido: "Updated content", user_id: @user.id, actividad_id: @actividad.id, fecha: DateTime.now } }
    assert_redirected_to index_resena_id_act_path(@actividad.id)
  end

  test "should not update resena with invalid data" do
    patch resena_path(@resena), params: { resena: { calificacion: nil, contenido: "", user_id: nil, actividad_id: nil, fecha: nil } }
    assert_template :edit
    assert_response :unprocessable_entity
  end

  test "should update resena as admin" do
    sign_out @user
    sign_in @admin
    patch resena_path(@resena), params: { resena: { calificacion: 4, contenido: "Updated content", user_id: @user.id, actividad_id: @actividad.id, fecha: DateTime.now } }
    assert_redirected_to admin_resenas_path
  end

  test "should destroy resena" do
    assert_difference('Resena.count', -1) do
      delete resena_path(@resena)
    end
    assert_redirected_to index_resena_id_act_path(@actividad.id)
  end
  
  test "should destroy resena as admin" do
    sign_out @user
    sign_in @admin
    assert_difference('Resena.count', -1) do
      delete resena_path(@resena)
    end
    assert_redirected_to admin_resenas_path
  end

  test "should destroy resena de mi actividad" do
    assert_difference('Resena.count', -1) do
      delete eliminar_path(@resena)
    end
    assert_redirected_to index_mi_resena_id_act_path(@actividad.id)
  end
end

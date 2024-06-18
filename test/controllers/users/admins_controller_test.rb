require "test_helper"

class Users::AdminsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:admin)  # Asegúrate de que tienes un usuario administrador en tus fixtures o factories
    sign_in @admin
  end

  test "should update user to non-admin" do
    get admin_path(user_id: @admin.id)
    assert_redirected_to admin_usuarios_path
    assert_equal "Usuario: #{@admin.name} ya no es Administrador", flash[:notice]
    @admin.reload
    assert_not @admin.admin?
  end

  test "should update user to admin" do
    user = users(:one)  # Un usuario normal para probar el cambio a no-administrador
    get admin_path(user_id: user.id)
    assert_redirected_to admin_usuarios_path
    assert_equal "Usuario: #{user.name} ahora es Administrador", flash[:notice]
    user.reload
    assert user.admin?
  end

  test "should destroy user" do
    user = users(:two)  # Un usuario específico que deseas eliminar
    assert_difference('User.count', -1) do
      delete admin_path(user_id: user.id)
    end
    assert_redirected_to admin_usuarios_path
    assert_equal "El usuario #{user.email} se elimino correctamente por admin", flash[:notice]
  end

  test "should get resenas" do
    get admin_resenas_path
    assert_response :success
  end

  test "should get rooms" do
    get admin_rooms_path
    assert_response :success
  end

  test "should get actividades" do
    get admin_actividades_path
    assert_response :success
  end

  test "should get solicitudes" do
    get admin_solicitudes_path
    assert_response :success
  end

  test "should get usuarios" do
    get admin_usuarios_path
    assert_response :success
  end
end

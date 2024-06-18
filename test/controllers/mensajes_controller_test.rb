require "test_helper"

class MensajesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mensaje = mensajes(:one)  # Asume que tienes un mensaje de ejemplo en tus fixtures o factories
  end

  test "should get index" do
    get mensajes_path
    assert_response :success
  end

  test "should get show" do
    get mensajes_path(id: @mensaje)
    assert_response :success
  end

  test "should get new" do
    get new_mensaje_path
    assert_response :success
  end

end

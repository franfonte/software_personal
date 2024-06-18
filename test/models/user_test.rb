# frozen_string_literal: true

require 'test_helper' 

class UserTest < ActiveSupport::TestCase

  test "validates presence of name" do
    user = User.new(name: nil)
    assert_not user.save, "Saved the user without a name"
  end

  test "validates presence of descripcion" do
    user = User.new(descripcion: nil)
    assert_not user.save, "Saved the user without a descripcion"
  end
  
  test "validates numericality of phone" do
    user = User.new(phone: "123abc")
    assert_not user.valid?, "Phone should only allow integers"
  end
  
  test "should destroy associated actividades" do
    user = users(:one)  # Utiliza fixtures o crea un usuario para la prueba
    assert_difference('Actividad.count', -1) do
      user.destroy
    end
  end

  test "scope all_except excludes specified user" do
    user = users(:one)  # Utiliza fixtures o crea un usuario para la prueba
    excluded_users = User.all_except(user)
    assert_not_includes excluded_users, user, "User should be excluded from scope"
  end

end


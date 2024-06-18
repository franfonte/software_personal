# frozen_string_literal: true

require 'test_helper'

class RenderControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get render_index_url
    assert_response :success
  end

  test "should get mi_perfil" do
    get mi_perfil_url
    assert_response :success
  end

  test "should get inicio" do
    get inicio_url
    assert_response :success
  end

  test "should redirect to reclamos path with notice" do
    get crear_reclamo_path, params: { tipo_de_reclamo: 'Funcionalidad', descripcion: 'Descripción del reclamo' }
    
    assert_redirected_to reclamos_path
    follow_redirect!
    
    assert_select 'p.notice', text: "Tu reclamo de tipo Funcionalidad se creó correctamente"
  end

  
end
#bin/rails test -b test/controllers/render_controller_test.rb
require "test_helper"

class LTipoUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_tipo_usuario = l_tipo_usuarios(:one)
  end

  test "should get index" do
    get l_tipo_usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_l_tipo_usuario_url
    assert_response :success
  end

  test "should create l_tipo_usuario" do
    assert_difference("LTipoUsuario.count") do
      post l_tipo_usuarios_url, params: { l_tipo_usuario: { description: @l_tipo_usuario.description } }
    end

    assert_redirected_to l_tipo_usuario_url(LTipoUsuario.last)
  end

  test "should show l_tipo_usuario" do
    get l_tipo_usuario_url(@l_tipo_usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_tipo_usuario_url(@l_tipo_usuario)
    assert_response :success
  end

  test "should update l_tipo_usuario" do
    patch l_tipo_usuario_url(@l_tipo_usuario), params: { l_tipo_usuario: { description: @l_tipo_usuario.description } }
    assert_redirected_to l_tipo_usuario_url(@l_tipo_usuario)
  end

  test "should destroy l_tipo_usuario" do
    assert_difference("LTipoUsuario.count", -1) do
      delete l_tipo_usuario_url(@l_tipo_usuario)
    end

    assert_redirected_to l_tipo_usuarios_url
  end
end

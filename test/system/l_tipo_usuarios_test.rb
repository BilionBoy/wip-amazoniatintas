require "application_system_test_case"

class LTipoUsuariosTest < ApplicationSystemTestCase
  setup do
    @l_tipo_usuario = l_tipo_usuarios(:one)
  end

  test "visiting the index" do
    visit l_tipo_usuarios_url
    assert_selector "h1", text: "L tipo usuarios"
  end

  test "should create l tipo usuario" do
    visit l_tipo_usuarios_url
    click_on "New l tipo usuario"

    fill_in "Description", with: @l_tipo_usuario.description
    click_on "Create L tipo usuario"

    assert_text "L tipo usuario was successfully created"
    click_on "Back"
  end

  test "should update L tipo usuario" do
    visit l_tipo_usuario_url(@l_tipo_usuario)
    click_on "Edit this l tipo usuario", match: :first

    fill_in "Description", with: @l_tipo_usuario.description
    click_on "Update L tipo usuario"

    assert_text "L tipo usuario was successfully updated"
    click_on "Back"
  end

  test "should destroy L tipo usuario" do
    visit l_tipo_usuario_url(@l_tipo_usuario)
    click_on "Destroy this l tipo usuario", match: :first

    assert_text "L tipo usuario was successfully destroyed"
  end
end

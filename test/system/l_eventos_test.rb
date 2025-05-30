require "application_system_test_case"

class LEventosTest < ApplicationSystemTestCase
  setup do
    @l_evento = l_eventos(:one)
  end

  test "visiting the index" do
    visit l_eventos_url
    assert_selector "h1", text: "L eventos"
  end

  test "should create l evento" do
    visit l_eventos_url
    click_on "New l evento"

    fill_in "Conteudo", with: @l_evento.conteudo
    fill_in "Data evento", with: @l_evento.data_evento
    fill_in "L categoria", with: @l_evento.l_categoria_id
    fill_in "Titulo", with: @l_evento.titulo
    click_on "Create L evento"

    assert_text "L evento was successfully created"
    click_on "Back"
  end

  test "should update L evento" do
    visit l_evento_url(@l_evento)
    click_on "Edit this l evento", match: :first

    fill_in "Conteudo", with: @l_evento.conteudo
    fill_in "Data evento", with: @l_evento.data_evento.to_s
    fill_in "L categoria", with: @l_evento.l_categoria_id
    fill_in "Titulo", with: @l_evento.titulo
    click_on "Update L evento"

    assert_text "L evento was successfully updated"
    click_on "Back"
  end

  test "should destroy L evento" do
    visit l_evento_url(@l_evento)
    click_on "Destroy this l evento", match: :first

    assert_text "L evento was successfully destroyed"
  end
end

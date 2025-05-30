require "application_system_test_case"

class TitulosTest < ApplicationSystemTestCase
  setup do
    @titulo = titulos(:one)
  end

  test "visiting the index" do
    visit titulos_url
    assert_selector "h1", text: "Titulos"
  end

  test "should create titulo" do
    visit titulos_url
    click_on "New titulo"

    fill_in "Conteudo text", with: @titulo.conteudo_text
    fill_in "Data evento", with: @titulo.data_evento
    fill_in "L categoria", with: @titulo.l_categoria_id
    click_on "Create Titulo"

    assert_text "Titulo was successfully created"
    click_on "Back"
  end

  test "should update Titulo" do
    visit titulo_url(@titulo)
    click_on "Edit this titulo", match: :first

    fill_in "Conteudo text", with: @titulo.conteudo_text
    fill_in "Data evento", with: @titulo.data_evento.to_s
    fill_in "L categoria", with: @titulo.l_categoria_id
    click_on "Update Titulo"

    assert_text "Titulo was successfully updated"
    click_on "Back"
  end

  test "should destroy Titulo" do
    visit titulo_url(@titulo)
    click_on "Destroy this titulo", match: :first

    assert_text "Titulo was successfully destroyed"
  end
end

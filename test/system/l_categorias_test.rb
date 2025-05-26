require "application_system_test_case"

class LCategoriaTest < ApplicationSystemTestCase
  setup do
    @l_categoria = l_categorias(:one)
  end

  test "visiting the index" do
    visit l_categorias_url
    assert_selector "h1", text: "L categoria"
  end

  test "should create l categoria" do
    visit l_categorias_url
    click_on "New l categoria"

    fill_in "Descricao", with: @l_categoria.descricao
    fill_in "L segmento", with: @l_categoria.l_segmento_id
    fill_in "Nome", with: @l_categoria.nome
    click_on "Create L categoria"

    assert_text "L categoria was successfully created"
    click_on "Back"
  end

  test "should update L categoria" do
    visit l_categoria_url(@l_categoria)
    click_on "Edit this l categoria", match: :first

    fill_in "Descricao", with: @l_categoria.descricao
    fill_in "L segmento", with: @l_categoria.l_segmento_id
    fill_in "Nome", with: @l_categoria.nome
    click_on "Update L categoria"

    assert_text "L categoria was successfully updated"
    click_on "Back"
  end

  test "should destroy L categoria" do
    visit l_categoria_url(@l_categoria)
    click_on "Destroy this l categoria", match: :first

    assert_text "L categoria was successfully destroyed"
  end
end

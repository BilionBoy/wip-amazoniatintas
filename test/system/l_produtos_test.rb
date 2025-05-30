require "application_system_test_case"

class LProdutosTest < ApplicationSystemTestCase
  setup do
    @l_produto = l_produtos(:one)
  end

  test "visiting the index" do
    visit l_produtos_url
    assert_selector "h1", text: "L produtos"
  end

  test "should create l produto" do
    visit l_produtos_url
    click_on "New l produto"

    fill_in "Descricao", with: @l_produto.descricao
    fill_in "L categoria", with: @l_produto.l_categoria_id
    fill_in "Preco", with: @l_produto.preco
    fill_in "Quantidade estoque", with: @l_produto.quantidade_estoque
    fill_in "Titulo", with: @l_produto.titulo
    click_on "Create L produto"

    assert_text "L produto was successfully created"
    click_on "Back"
  end

  test "should update L produto" do
    visit l_produto_url(@l_produto)
    click_on "Edit this l produto", match: :first

    fill_in "Descricao", with: @l_produto.descricao
    fill_in "L categoria", with: @l_produto.l_categoria_id
    fill_in "Preco", with: @l_produto.preco
    fill_in "Quantidade estoque", with: @l_produto.quantidade_estoque
    fill_in "Titulo", with: @l_produto.titulo
    click_on "Update L produto"

    assert_text "L produto was successfully updated"
    click_on "Back"
  end

  test "should destroy L produto" do
    visit l_produto_url(@l_produto)
    click_on "Destroy this l produto", match: :first

    assert_text "L produto was successfully destroyed"
  end
end

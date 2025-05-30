require "test_helper"

class LProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_produto = l_produtos(:one)
  end

  test "should get index" do
    get l_produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_l_produto_url
    assert_response :success
  end

  test "should create l_produto" do
    assert_difference("LProduto.count") do
      post l_produtos_url, params: { l_produto: { descricao: @l_produto.descricao, l_categoria_id: @l_produto.l_categoria_id, preco: @l_produto.preco, quantidade_estoque: @l_produto.quantidade_estoque, titulo: @l_produto.titulo } }
    end

    assert_redirected_to l_produto_url(LProduto.last)
  end

  test "should show l_produto" do
    get l_produto_url(@l_produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_produto_url(@l_produto)
    assert_response :success
  end

  test "should update l_produto" do
    patch l_produto_url(@l_produto), params: { l_produto: { descricao: @l_produto.descricao, l_categoria_id: @l_produto.l_categoria_id, preco: @l_produto.preco, quantidade_estoque: @l_produto.quantidade_estoque, titulo: @l_produto.titulo } }
    assert_redirected_to l_produto_url(@l_produto)
  end

  test "should destroy l_produto" do
    assert_difference("LProduto.count", -1) do
      delete l_produto_url(@l_produto)
    end

    assert_redirected_to l_produtos_url
  end
end

require "test_helper"

class LCategoriasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_categoria = l_categorias(:one)
  end

  test "should get index" do
    get l_categorias_url
    assert_response :success
  end

  test "should get new" do
    get new_l_categoria_url
    assert_response :success
  end

  test "should create l_categoria" do
    assert_difference("LCategoria.count") do
      post l_categorias_url, params: { l_categoria: { descricao: @l_categoria.descricao, l_segmento_id: @l_categoria.l_segmento_id, nome: @l_categoria.nome } }
    end

    assert_redirected_to l_categoria_url(LCategoria.last)
  end

  test "should show l_categoria" do
    get l_categoria_url(@l_categoria)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_categoria_url(@l_categoria)
    assert_response :success
  end

  test "should update l_categoria" do
    patch l_categoria_url(@l_categoria), params: { l_categoria: { descricao: @l_categoria.descricao, l_segmento_id: @l_categoria.l_segmento_id, nome: @l_categoria.nome } }
    assert_redirected_to l_categoria_url(@l_categoria)
  end

  test "should destroy l_categoria" do
    assert_difference("LCategoria.count", -1) do
      delete l_categoria_url(@l_categoria)
    end

    assert_redirected_to l_categorias_url
  end
end

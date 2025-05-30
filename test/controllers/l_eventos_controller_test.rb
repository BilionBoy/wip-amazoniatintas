require "test_helper"

class LEventosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_evento = l_eventos(:one)
  end

  test "should get index" do
    get l_eventos_url
    assert_response :success
  end

  test "should get new" do
    get new_l_evento_url
    assert_response :success
  end

  test "should create l_evento" do
    assert_difference("LEvento.count") do
      post l_eventos_url, params: { l_evento: { conteudo: @l_evento.conteudo, data_evento: @l_evento.data_evento, l_categoria_id: @l_evento.l_categoria_id, titulo: @l_evento.titulo } }
    end

    assert_redirected_to l_evento_url(LEvento.last)
  end

  test "should show l_evento" do
    get l_evento_url(@l_evento)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_evento_url(@l_evento)
    assert_response :success
  end

  test "should update l_evento" do
    patch l_evento_url(@l_evento), params: { l_evento: { conteudo: @l_evento.conteudo, data_evento: @l_evento.data_evento, l_categoria_id: @l_evento.l_categoria_id, titulo: @l_evento.titulo } }
    assert_redirected_to l_evento_url(@l_evento)
  end

  test "should destroy l_evento" do
    assert_difference("LEvento.count", -1) do
      delete l_evento_url(@l_evento)
    end

    assert_redirected_to l_eventos_url
  end
end

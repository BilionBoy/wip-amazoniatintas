require "test_helper"

class LSegmentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_segmento = l_segmentos(:one)
  end

  test "should get index" do
    get l_segmentos_url
    assert_response :success
  end

  test "should get new" do
    get new_l_segmento_url
    assert_response :success
  end

  test "should create l_segmento" do
    assert_difference("LSegmento.count") do
      post l_segmentos_url, params: { l_segmento: { descricao: @l_segmento.descricao } }
    end

    assert_redirected_to l_segmento_url(LSegmento.last)
  end

  test "should show l_segmento" do
    get l_segmento_url(@l_segmento)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_segmento_url(@l_segmento)
    assert_response :success
  end

  test "should update l_segmento" do
    patch l_segmento_url(@l_segmento), params: { l_segmento: { descricao: @l_segmento.descricao } }
    assert_redirected_to l_segmento_url(@l_segmento)
  end

  test "should destroy l_segmento" do
    assert_difference("LSegmento.count", -1) do
      delete l_segmento_url(@l_segmento)
    end

    assert_redirected_to l_segmentos_url
  end
end

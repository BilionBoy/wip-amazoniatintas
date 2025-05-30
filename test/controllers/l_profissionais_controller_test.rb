require "test_helper"

class LProfissionaisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_profissional = l_profissionais(:one)
  end

  test "should get index" do
    get l_profissionais_url
    assert_response :success
  end

  test "should get new" do
    get new_l_profissional_url
    assert_response :success
  end

  test "should create l_profissional" do
    assert_difference("LProfissional.count") do
      post l_profissionais_url, params: { l_profissional: { descricao: @l_profissional.descricao, especialidade: @l_profissional.especialidade, nome: @l_profissional.nome } }
    end

    assert_redirected_to l_profissional_url(LProfissional.last)
  end

  test "should show l_profissional" do
    get l_profissional_url(@l_profissional)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_profissional_url(@l_profissional)
    assert_response :success
  end

  test "should update l_profissional" do
    patch l_profissional_url(@l_profissional), params: { l_profissional: { descricao: @l_profissional.descricao, especialidade: @l_profissional.especialidade, nome: @l_profissional.nome } }
    assert_redirected_to l_profissional_url(@l_profissional)
  end

  test "should destroy l_profissional" do
    assert_difference("LProfissional.count", -1) do
      delete l_profissional_url(@l_profissional)
    end

    assert_redirected_to l_profissionais_url
  end
end

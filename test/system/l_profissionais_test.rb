require "application_system_test_case"

class LProfissionalsTest < ApplicationSystemTestCase
  setup do
    @l_profissional = l_profissionais(:one)
  end

  test "visiting the index" do
    visit l_profissionais_url
    assert_selector "h1", text: "L profissionals"
  end

  test "should create l profissional" do
    visit l_profissionais_url
    click_on "New l profissional"

    fill_in "Descricao", with: @l_profissional.descricao
    fill_in "Especialidade", with: @l_profissional.especialidade
    fill_in "Nome", with: @l_profissional.nome
    click_on "Create L profissional"

    assert_text "L profissional was successfully created"
    click_on "Back"
  end

  test "should update L profissional" do
    visit l_profissional_url(@l_profissional)
    click_on "Edit this l profissional", match: :first

    fill_in "Descricao", with: @l_profissional.descricao
    fill_in "Especialidade", with: @l_profissional.especialidade
    fill_in "Nome", with: @l_profissional.nome
    click_on "Update L profissional"

    assert_text "L profissional was successfully updated"
    click_on "Back"
  end

  test "should destroy L profissional" do
    visit l_profissional_url(@l_profissional)
    click_on "Destroy this l profissional", match: :first

    assert_text "L profissional was successfully destroyed"
  end
end

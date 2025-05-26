require "application_system_test_case"

class LSegmentosTest < ApplicationSystemTestCase
  setup do
    @l_segmento = l_segmentos(:one)
  end

  test "visiting the index" do
    visit l_segmentos_url
    assert_selector "h1", text: "L segmentos"
  end

  test "should create l segmento" do
    visit l_segmentos_url
    click_on "New l segmento"

    fill_in "Descricao", with: @l_segmento.descricao
    click_on "Create L segmento"

    assert_text "L segmento was successfully created"
    click_on "Back"
  end

  test "should update L segmento" do
    visit l_segmento_url(@l_segmento)
    click_on "Edit this l segmento", match: :first

    fill_in "Descricao", with: @l_segmento.descricao
    click_on "Update L segmento"

    assert_text "L segmento was successfully updated"
    click_on "Back"
  end

  test "should destroy L segmento" do
    visit l_segmento_url(@l_segmento)
    click_on "Destroy this l segmento", match: :first

    assert_text "L segmento was successfully destroyed"
  end
end

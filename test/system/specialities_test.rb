require "application_system_test_case"

class SpecialitiesTest < ApplicationSystemTestCase
  setup do
    @speciality = specialities(:one)
  end

  test "visiting the index" do
    visit specialities_url
    assert_selector "h1", text: "Specialities"
  end

  test "creating a Speciality" do
    visit specialities_url
    click_on "New Speciality"

    fill_in "Description", with: @speciality.description
    fill_in "Name", with: @speciality.name
    click_on "Create Speciality"

    assert_text "Speciality was successfully created"
    click_on "Back"
  end

  test "updating a Speciality" do
    visit specialities_url
    click_on "Edit", match: :first

    fill_in "Description", with: @speciality.description
    fill_in "Name", with: @speciality.name
    click_on "Update Speciality"

    assert_text "Speciality was successfully updated"
    click_on "Back"
  end

  test "destroying a Speciality" do
    visit specialities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Speciality was successfully destroyed"
  end
end

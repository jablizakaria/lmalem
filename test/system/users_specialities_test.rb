require "application_system_test_case"

class UsersSpecialitiesTest < ApplicationSystemTestCase
  setup do
    @users_speciality = users_specialities(:one)
  end

  test "visiting the index" do
    visit users_specialities_url
    assert_selector "h1", text: "Users Specialities"
  end

  test "creating a Users speciality" do
    visit users_specialities_url
    click_on "New Users Speciality"

    fill_in "Avg Behaviour", with: @users_speciality.avg_behaviour
    fill_in "Avg Efficacy", with: @users_speciality.avg_efficacy
    fill_in "Avg Punctuation", with: @users_speciality.avg_punctuation
    fill_in "Description", with: @users_speciality.description
    fill_in "Speciality", with: @users_speciality.speciality_id
    fill_in "User", with: @users_speciality.user_id
    click_on "Create Users speciality"

    assert_text "Users speciality was successfully created"
    click_on "Back"
  end

  test "updating a Users speciality" do
    visit users_specialities_url
    click_on "Edit", match: :first

    fill_in "Avg Behaviour", with: @users_speciality.avg_behaviour
    fill_in "Avg Efficacy", with: @users_speciality.avg_efficacy
    fill_in "Avg Punctuation", with: @users_speciality.avg_punctuation
    fill_in "Description", with: @users_speciality.description
    fill_in "Speciality", with: @users_speciality.speciality_id
    fill_in "User", with: @users_speciality.user_id
    click_on "Update Users speciality"

    assert_text "Users speciality was successfully updated"
    click_on "Back"
  end

  test "destroying a Users speciality" do
    visit users_specialities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Users speciality was successfully destroyed"
  end
end

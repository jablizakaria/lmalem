require 'test_helper'

class UsersSpecialitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_speciality = users_specialities(:one)
  end

  test "should get index" do
    get users_specialities_url
    assert_response :success
  end

  test "should get new" do
    get new_users_speciality_url
    assert_response :success
  end

  test "should create users_speciality" do
    assert_difference('UsersSpeciality.count') do
      post users_specialities_url, params: { users_speciality: { avg_behaviour: @users_speciality.avg_behaviour, avg_efficacy: @users_speciality.avg_efficacy, avg_punctuation: @users_speciality.avg_punctuation, description: @users_speciality.description, speciality_id: @users_speciality.speciality_id, user_id: @users_speciality.user_id } }
    end

    assert_redirected_to users_speciality_url(UsersSpeciality.last)
  end

  test "should show users_speciality" do
    get users_speciality_url(@users_speciality)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_speciality_url(@users_speciality)
    assert_response :success
  end

  test "should update users_speciality" do
    patch users_speciality_url(@users_speciality), params: { users_speciality: { avg_behaviour: @users_speciality.avg_behaviour, avg_efficacy: @users_speciality.avg_efficacy, avg_punctuation: @users_speciality.avg_punctuation, description: @users_speciality.description, speciality_id: @users_speciality.speciality_id, user_id: @users_speciality.user_id } }
    assert_redirected_to users_speciality_url(@users_speciality)
  end

  test "should destroy users_speciality" do
    assert_difference('UsersSpeciality.count', -1) do
      delete users_speciality_url(@users_speciality)
    end

    assert_redirected_to users_specialities_url
  end
end

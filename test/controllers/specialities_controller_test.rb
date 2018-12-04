require 'test_helper'

class SpecialitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @speciality = specialities(:one)
  end

  test "should get index" do
    get specialities_url
    assert_response :success
  end

  test "should get new" do
    get new_speciality_url
    assert_response :success
  end

  test "should create speciality" do
    assert_difference('Speciality.count') do
      post specialities_url, params: { speciality: { description: @speciality.description, name: @speciality.name } }
    end

    assert_redirected_to speciality_url(Speciality.last)
  end

  test "should show speciality" do
    get speciality_url(@speciality)
    assert_response :success
  end

  test "should get edit" do
    get edit_speciality_url(@speciality)
    assert_response :success
  end

  test "should update speciality" do
    patch speciality_url(@speciality), params: { speciality: { description: @speciality.description, name: @speciality.name } }
    assert_redirected_to speciality_url(@speciality)
  end

  test "should destroy speciality" do
    assert_difference('Speciality.count', -1) do
      delete speciality_url(@speciality)
    end

    assert_redirected_to specialities_url
  end
end

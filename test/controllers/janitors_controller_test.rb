require 'test_helper'

class JanitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @janitor = janitors(:one)
  end

  test "should get index" do
    get janitors_url
    assert_response :success
  end

  test "should get new" do
    get new_janitor_url
    assert_response :success
  end

  test "should create janitor" do
    assert_difference('Janitor.count') do
      post janitors_url, params: { janitor: { name: @janitor.name } }
    end

    assert_redirected_to janitor_url(Janitor.last)
  end

  test "should show janitor" do
    get janitor_url(@janitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_janitor_url(@janitor)
    assert_response :success
  end

  test "should update janitor" do
    patch janitor_url(@janitor), params: { janitor: { name: @janitor.name } }
    assert_redirected_to janitor_url(@janitor)
  end

  test "should destroy janitor" do
    assert_difference('Janitor.count', -1) do
      delete janitor_url(@janitor)
    end

    assert_redirected_to janitors_url
  end
end

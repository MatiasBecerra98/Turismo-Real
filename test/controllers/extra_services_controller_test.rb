require 'test_helper'

class ExtraServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extra_service = extra_services(:one)
  end

  test "should get index" do
    get extra_services_url
    assert_response :success
  end

  test "should get new" do
    get new_extra_service_url
    assert_response :success
  end

  test "should create extra_service" do
    assert_difference('ExtraService.count') do
      post extra_services_url, params: { extra_service: { name: @extra_service.name, reservation_id: @extra_service.reservation_id } }
    end

    assert_redirected_to extra_service_url(ExtraService.last)
  end

  test "should show extra_service" do
    get extra_service_url(@extra_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_extra_service_url(@extra_service)
    assert_response :success
  end

  test "should update extra_service" do
    patch extra_service_url(@extra_service), params: { extra_service: { name: @extra_service.name, reservation_id: @extra_service.reservation_id } }
    assert_redirected_to extra_service_url(@extra_service)
  end

  test "should destroy extra_service" do
    assert_difference('ExtraService.count', -1) do
      delete extra_service_url(@extra_service)
    end

    assert_redirected_to extra_services_url
  end
end

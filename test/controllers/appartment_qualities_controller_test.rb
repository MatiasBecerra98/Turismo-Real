require 'test_helper'

class AppartmentQualitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appartment_quality = appartment_qualities(:one)
  end

  test "should get index" do
    get appartment_qualities_url
    assert_response :success
  end

  test "should get new" do
    get new_appartment_quality_url
    assert_response :success
  end

  test "should create appartment_quality" do
    assert_difference('AppartmentQuality.count') do
      post appartment_qualities_url, params: { appartment_quality: { appartment_id: @appartment_quality.appartment_id, cable: @appartment_quality.cable, calefaction: @appartment_quality.calefaction, conditioned_air: @appartment_quality.conditioned_air, internet: @appartment_quality.internet } }
    end

    assert_redirected_to appartment_quality_url(AppartmentQuality.last)
  end

  test "should show appartment_quality" do
    get appartment_quality_url(@appartment_quality)
    assert_response :success
  end

  test "should get edit" do
    get edit_appartment_quality_url(@appartment_quality)
    assert_response :success
  end

  test "should update appartment_quality" do
    patch appartment_quality_url(@appartment_quality), params: { appartment_quality: { appartment_id: @appartment_quality.appartment_id, cable: @appartment_quality.cable, calefaction: @appartment_quality.calefaction, conditioned_air: @appartment_quality.conditioned_air, internet: @appartment_quality.internet } }
    assert_redirected_to appartment_quality_url(@appartment_quality)
  end

  test "should destroy appartment_quality" do
    assert_difference('AppartmentQuality.count', -1) do
      delete appartment_quality_url(@appartment_quality)
    end

    assert_redirected_to appartment_qualities_url
  end
end

require 'test_helper'

class SupplyMovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supply_movement = supply_movements(:one)
  end

  test "should get index" do
    get supply_movements_url
    assert_response :success
  end

  test "should get new" do
    get new_supply_movement_url
    assert_response :success
  end

  test "should create supply_movement" do
    assert_difference('SupplyMovement.count') do
      post supply_movements_url, params: { supply_movement: { appartment_id: @supply_movement.appartment_id, movement: @supply_movement.movement, supply_id: @supply_movement.supply_id } }
    end

    assert_redirected_to supply_movement_url(SupplyMovement.last)
  end

  test "should show supply_movement" do
    get supply_movement_url(@supply_movement)
    assert_response :success
  end

  test "should get edit" do
    get edit_supply_movement_url(@supply_movement)
    assert_response :success
  end

  test "should update supply_movement" do
    patch supply_movement_url(@supply_movement), params: { supply_movement: { appartment_id: @supply_movement.appartment_id, movement: @supply_movement.movement, supply_id: @supply_movement.supply_id } }
    assert_redirected_to supply_movement_url(@supply_movement)
  end

  test "should destroy supply_movement" do
    assert_difference('SupplyMovement.count', -1) do
      delete supply_movement_url(@supply_movement)
    end

    assert_redirected_to supply_movements_url
  end
end

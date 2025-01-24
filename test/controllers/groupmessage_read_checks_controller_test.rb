require "test_helper"

class GroupmessageReadChecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupmessage_read_check = groupmessage_read_checks(:one)
  end

  test "should get index" do
    get groupmessage_read_checks_url
    assert_response :success
  end

  test "should get new" do
    get new_groupmessage_read_check_url
    assert_response :success
  end

  test "should create groupmessage_read_check" do
    assert_difference('GroupmessageReadCheck.count') do
      post groupmessage_read_checks_url, params: { groupmessage_read_check: { group_id: @groupmessage_read_check.group_id, groupmessage_id: @groupmessage_read_check.groupmessage_id, read: @groupmessage_read_check.read, user_id: @groupmessage_read_check.user_id } }
    end

    assert_redirected_to groupmessage_read_check_url(GroupmessageReadCheck.last)
  end

  test "should show groupmessage_read_check" do
    get groupmessage_read_check_url(@groupmessage_read_check)
    assert_response :success
  end

  test "should get edit" do
    get edit_groupmessage_read_check_url(@groupmessage_read_check)
    assert_response :success
  end

  test "should update groupmessage_read_check" do
    patch groupmessage_read_check_url(@groupmessage_read_check), params: { groupmessage_read_check: { group_id: @groupmessage_read_check.group_id, groupmessage_id: @groupmessage_read_check.groupmessage_id, read: @groupmessage_read_check.read, user_id: @groupmessage_read_check.user_id } }
    assert_redirected_to groupmessage_read_check_url(@groupmessage_read_check)
  end

  test "should destroy groupmessage_read_check" do
    assert_difference('GroupmessageReadCheck.count', -1) do
      delete groupmessage_read_check_url(@groupmessage_read_check)
    end

    assert_redirected_to groupmessage_read_checks_url
  end
end

require "test_helper"

class GroupmessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupmessage = groupmessages(:one)
  end

  test "should get index" do
    get groupmessages_url
    assert_response :success
  end

  test "should get new" do
    get new_groupmessage_url
    assert_response :success
  end

  test "should create groupmessage" do
    assert_difference('Groupmessage.count') do
      post groupmessages_url, params: { groupmessage: { group_id: @groupmessage.group_id, message: @groupmessage.message, user_id: @groupmessage.user_id } }
    end

    assert_redirected_to groupmessage_url(Groupmessage.last)
  end

  test "should show groupmessage" do
    get groupmessage_url(@groupmessage)
    assert_response :success
  end

  test "should get edit" do
    get edit_groupmessage_url(@groupmessage)
    assert_response :success
  end

  test "should update groupmessage" do
    patch groupmessage_url(@groupmessage), params: { groupmessage: { group_id: @groupmessage.group_id, message: @groupmessage.message, user_id: @groupmessage.user_id } }
    assert_redirected_to groupmessage_url(@groupmessage)
  end

  test "should destroy groupmessage" do
    assert_difference('Groupmessage.count', -1) do
      delete groupmessage_url(@groupmessage)
    end

    assert_redirected_to groupmessages_url
  end
end

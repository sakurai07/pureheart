require "test_helper"

class GroupmembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupmember = groupmembers(:one)
  end

  test "should get index" do
    get groupmembers_url
    assert_response :success
  end

  test "should get new" do
    get new_groupmember_url
    assert_response :success
  end

  test "should create groupmember" do
    assert_difference('Groupmember.count') do
      post groupmembers_url, params: { groupmember: { group_id: @groupmember.group_id, user_id: @groupmember.user_id } }
    end

    assert_redirected_to groupmember_url(Groupmember.last)
  end

  test "should show groupmember" do
    get groupmember_url(@groupmember)
    assert_response :success
  end

  test "should get edit" do
    get edit_groupmember_url(@groupmember)
    assert_response :success
  end

  test "should update groupmember" do
    patch groupmember_url(@groupmember), params: { groupmember: { group_id: @groupmember.group_id, user_id: @groupmember.user_id } }
    assert_redirected_to groupmember_url(@groupmember)
  end

  test "should destroy groupmember" do
    assert_difference('Groupmember.count', -1) do
      delete groupmember_url(@groupmember)
    end

    assert_redirected_to groupmembers_url
  end
end

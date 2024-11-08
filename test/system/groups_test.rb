require "application_system_test_case"

class GroupsTest < ApplicationSystemTestCase
  setup do
    @group = groups(:one)
  end

  test "visiting the index" do
    visit groups_url
    assert_selector "h1", text: "Groups"
  end

  test "creating a Group" do
    visit groups_url
    click_on "New Group"

    fill_in "Comment", with: @group.comment
    fill_in "Group name", with: @group.group_name
    fill_in "Hobby 1", with: @group.hobby_1
    fill_in "Hobby 2", with: @group.hobby_2
    fill_in "Hobby 3", with: @group.hobby_3
    fill_in "Hobby 4", with: @group.hobby_4
    fill_in "Hobby 5", with: @group.hobby_5
    fill_in "User", with: @group.user_id
    click_on "Create Group"

    assert_text "Group was successfully created"
    click_on "Back"
  end

  test "updating a Group" do
    visit groups_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @group.comment
    fill_in "Group name", with: @group.group_name
    fill_in "Hobby 1", with: @group.hobby_1
    fill_in "Hobby 2", with: @group.hobby_2
    fill_in "Hobby 3", with: @group.hobby_3
    fill_in "Hobby 4", with: @group.hobby_4
    fill_in "Hobby 5", with: @group.hobby_5
    fill_in "User", with: @group.user_id
    click_on "Update Group"

    assert_text "Group was successfully updated"
    click_on "Back"
  end

  test "destroying a Group" do
    visit groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group was successfully destroyed"
  end
end

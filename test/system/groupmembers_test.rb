require "application_system_test_case"

class GroupmembersTest < ApplicationSystemTestCase
  setup do
    @groupmember = groupmembers(:one)
  end

  test "visiting the index" do
    visit groupmembers_url
    assert_selector "h1", text: "Groupmembers"
  end

  test "creating a Groupmember" do
    visit groupmembers_url
    click_on "New Groupmember"

    fill_in "Group", with: @groupmember.group_id
    fill_in "User", with: @groupmember.user_id
    click_on "Create Groupmember"

    assert_text "Groupmember was successfully created"
    click_on "Back"
  end

  test "updating a Groupmember" do
    visit groupmembers_url
    click_on "Edit", match: :first

    fill_in "Group", with: @groupmember.group_id
    fill_in "User", with: @groupmember.user_id
    click_on "Update Groupmember"

    assert_text "Groupmember was successfully updated"
    click_on "Back"
  end

  test "destroying a Groupmember" do
    visit groupmembers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Groupmember was successfully destroyed"
  end
end

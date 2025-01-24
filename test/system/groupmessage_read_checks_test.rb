require "application_system_test_case"

class GroupmessageReadChecksTest < ApplicationSystemTestCase
  setup do
    @groupmessage_read_check = groupmessage_read_checks(:one)
  end

  test "visiting the index" do
    visit groupmessage_read_checks_url
    assert_selector "h1", text: "Groupmessage Read Checks"
  end

  test "creating a Groupmessage read check" do
    visit groupmessage_read_checks_url
    click_on "New Groupmessage Read Check"

    fill_in "Group", with: @groupmessage_read_check.group_id
    fill_in "Groupmessage", with: @groupmessage_read_check.groupmessage_id
    check "Read" if @groupmessage_read_check.read
    fill_in "User", with: @groupmessage_read_check.user_id
    click_on "Create Groupmessage read check"

    assert_text "Groupmessage read check was successfully created"
    click_on "Back"
  end

  test "updating a Groupmessage read check" do
    visit groupmessage_read_checks_url
    click_on "Edit", match: :first

    fill_in "Group", with: @groupmessage_read_check.group_id
    fill_in "Groupmessage", with: @groupmessage_read_check.groupmessage_id
    check "Read" if @groupmessage_read_check.read
    fill_in "User", with: @groupmessage_read_check.user_id
    click_on "Update Groupmessage read check"

    assert_text "Groupmessage read check was successfully updated"
    click_on "Back"
  end

  test "destroying a Groupmessage read check" do
    visit groupmessage_read_checks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Groupmessage read check was successfully destroyed"
  end
end

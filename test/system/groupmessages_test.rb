require "application_system_test_case"

class GroupmessagesTest < ApplicationSystemTestCase
  setup do
    @groupmessage = groupmessages(:one)
  end

  test "visiting the index" do
    visit groupmessages_url
    assert_selector "h1", text: "Groupmessages"
  end

  test "creating a Groupmessage" do
    visit groupmessages_url
    click_on "New Groupmessage"

    fill_in "Group", with: @groupmessage.group_id
    fill_in "Message", with: @groupmessage.message
    fill_in "User", with: @groupmessage.user_id
    click_on "Create Groupmessage"

    assert_text "Groupmessage was successfully created"
    click_on "Back"
  end

  test "updating a Groupmessage" do
    visit groupmessages_url
    click_on "Edit", match: :first

    fill_in "Group", with: @groupmessage.group_id
    fill_in "Message", with: @groupmessage.message
    fill_in "User", with: @groupmessage.user_id
    click_on "Update Groupmessage"

    assert_text "Groupmessage was successfully updated"
    click_on "Back"
  end

  test "destroying a Groupmessage" do
    visit groupmessages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Groupmessage was successfully destroyed"
  end
end

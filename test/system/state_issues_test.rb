require "application_system_test_case"

class StateIssuesTest < ApplicationSystemTestCase
  setup do
    @state_issue = state_issues(:one)
  end

  test "visiting the index" do
    visit state_issues_url
    assert_selector "h1", text: "State Issues"
  end

  test "creating a State issue" do
    visit state_issues_url
    click_on "New State Issue"

    click_on "Create State issue"

    assert_text "State issue was successfully created"
    click_on "Back"
  end

  test "updating a State issue" do
    visit state_issues_url
    click_on "Edit", match: :first

    click_on "Update State issue"

    assert_text "State issue was successfully updated"
    click_on "Back"
  end

  test "destroying a State issue" do
    visit state_issues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "State issue was successfully destroyed"
  end
end

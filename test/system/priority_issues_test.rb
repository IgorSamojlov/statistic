require "application_system_test_case"

class PriorityIssuesTest < ApplicationSystemTestCase
  setup do
    @priority_issue = priority_issues(:one)
  end

  test "visiting the index" do
    visit priority_issues_url
    assert_selector "h1", text: "Priority Issues"
  end

  test "creating a Priority issue" do
    visit priority_issues_url
    click_on "New Priority Issue"

    click_on "Create Priority issue"

    assert_text "Priority issue was successfully created"
    click_on "Back"
  end

  test "updating a Priority issue" do
    visit priority_issues_url
    click_on "Edit", match: :first

    click_on "Update Priority issue"

    assert_text "Priority issue was successfully updated"
    click_on "Back"
  end

  test "destroying a Priority issue" do
    visit priority_issues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Priority issue was successfully destroyed"
  end
end

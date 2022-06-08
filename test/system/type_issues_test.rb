require "application_system_test_case"

class TypeIssuesTest < ApplicationSystemTestCase
  setup do
    @type_issue = type_issues(:one)
  end

  test "visiting the index" do
    visit type_issues_url
    assert_selector "h1", text: "Type Issues"
  end

  test "creating a Type issue" do
    visit type_issues_url
    click_on "New Type Issue"

    click_on "Create Type issue"

    assert_text "Type issue was successfully created"
    click_on "Back"
  end

  test "updating a Type issue" do
    visit type_issues_url
    click_on "Edit", match: :first

    click_on "Update Type issue"

    assert_text "Type issue was successfully updated"
    click_on "Back"
  end

  test "destroying a Type issue" do
    visit type_issues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type issue was successfully destroyed"
  end
end

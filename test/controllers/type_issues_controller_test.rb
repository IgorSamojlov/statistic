require 'test_helper'

class TypeIssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_issue = type_issues(:one)
  end

  test "should get index" do
    get type_issues_url
    assert_response :success
  end

  test "should get new" do
    get new_type_issue_url
    assert_response :success
  end

  test "should create type_issue" do
    assert_difference('TypeIssue.count') do
      post type_issues_url, params: { type_issue: {  } }
    end

    assert_redirected_to type_issue_url(TypeIssue.last)
  end

  test "should show type_issue" do
    get type_issue_url(@type_issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_issue_url(@type_issue)
    assert_response :success
  end

  test "should update type_issue" do
    patch type_issue_url(@type_issue), params: { type_issue: {  } }
    assert_redirected_to type_issue_url(@type_issue)
  end

  test "should destroy type_issue" do
    assert_difference('TypeIssue.count', -1) do
      delete type_issue_url(@type_issue)
    end

    assert_redirected_to type_issues_url
  end
end

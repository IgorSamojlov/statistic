require 'test_helper'

class PriorityIssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @priority_issue = priority_issues(:one)
  end

  test "should get index" do
    get priority_issues_url
    assert_response :success
  end

  test "should get new" do
    get new_priority_issue_url
    assert_response :success
  end

  test "should create priority_issue" do
    assert_difference('PriorityIssue.count') do
      post priority_issues_url, params: { priority_issue: {  } }
    end

    assert_redirected_to priority_issue_url(PriorityIssue.last)
  end

  test "should show priority_issue" do
    get priority_issue_url(@priority_issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_priority_issue_url(@priority_issue)
    assert_response :success
  end

  test "should update priority_issue" do
    patch priority_issue_url(@priority_issue), params: { priority_issue: {  } }
    assert_redirected_to priority_issue_url(@priority_issue)
  end

  test "should destroy priority_issue" do
    assert_difference('PriorityIssue.count', -1) do
      delete priority_issue_url(@priority_issue)
    end

    assert_redirected_to priority_issues_url
  end
end

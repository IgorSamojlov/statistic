require 'test_helper'

class StateIssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state_issue = state_issues(:one)
  end

  test "should get index" do
    get state_issues_url
    assert_response :success
  end

  test "should get new" do
    get new_state_issue_url
    assert_response :success
  end

  test "should create state_issue" do
    assert_difference('StateIssue.count') do
      post state_issues_url, params: { state_issue: {  } }
    end

    assert_redirected_to state_issue_url(StateIssue.last)
  end

  test "should show state_issue" do
    get state_issue_url(@state_issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_state_issue_url(@state_issue)
    assert_response :success
  end

  test "should update state_issue" do
    patch state_issue_url(@state_issue), params: { state_issue: {  } }
    assert_redirected_to state_issue_url(@state_issue)
  end

  test "should destroy state_issue" do
    assert_difference('StateIssue.count', -1) do
      delete state_issue_url(@state_issue)
    end

    assert_redirected_to state_issues_url
  end
end

require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  setup do
    @issue = issues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue" do
    assert_difference('Issue.count') do
      post :create, issue: { description: @issue.description, name: @issue.name, resolution_date: @issue.resolution_date, status: @issue.status, submited_date: @issue.submited_date, submitted_by: @issue.submitted_by }
    end

    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should show issue" do
    get :show, id: @issue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue
    assert_response :success
  end

  test "should update issue" do
    patch :update, id: @issue, issue: { description: @issue.description, name: @issue.name, resolution_date: @issue.resolution_date, status: @issue.status, submited_date: @issue.submited_date, submitted_by: @issue.submitted_by }
    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should destroy issue" do
    assert_difference('Issue.count', -1) do
      delete :destroy, id: @issue
    end

    assert_redirected_to issues_path
  end
end
require 'test_helper'

class EmployeeLicensesControllerTest < ActionController::TestCase
  setup do
    @employee_license = employee_licenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_licenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_license" do
    assert_difference('EmployeeLicense.count') do
      post :create, employee_license: { employee_id: @employee_license.employee_id, expiration_date: @employee_license.expiration_date, license_id: @employee_license.license_id, obtained?: @employee_license.obtained? }
    end

    assert_redirected_to employee_license_path(assigns(:employee_license))
  end

  test "should show employee_license" do
    get :show, id: @employee_license
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_license
    assert_response :success
  end

  test "should update employee_license" do
    patch :update, id: @employee_license, employee_license: { employee_id: @employee_license.employee_id, expiration_date: @employee_license.expiration_date, license_id: @employee_license.license_id, obtained?: @employee_license.obtained? }
    assert_redirected_to employee_license_path(assigns(:employee_license))
  end

  test "should destroy employee_license" do
    assert_difference('EmployeeLicense.count', -1) do
      delete :destroy, id: @employee_license
    end

    assert_redirected_to employee_licenses_path
  end
end

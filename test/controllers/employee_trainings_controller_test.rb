require 'test_helper'

class EmployeeTrainingsControllerTest < ActionController::TestCase
  setup do
    @employee_training = employee_trainings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_trainings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_training" do
    assert_difference('EmployeeTraining.count') do
      post :create, employee_training: { site_employee_id_id: @employee_training.site_employee_id_id, training_id: @employee_training.training_id }
    end

    assert_redirected_to employee_training_path(assigns(:employee_training))
  end

  test "should show employee_training" do
    get :show, id: @employee_training
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_training
    assert_response :success
  end

  test "should update employee_training" do
    patch :update, id: @employee_training, employee_training: { site_employee_id_id: @employee_training.site_employee_id_id, training_id: @employee_training.training_id }
    assert_redirected_to employee_training_path(assigns(:employee_training))
  end

  test "should destroy employee_training" do
    assert_difference('EmployeeTraining.count', -1) do
      delete :destroy, id: @employee_training
    end

    assert_redirected_to employee_trainings_path
  end
end

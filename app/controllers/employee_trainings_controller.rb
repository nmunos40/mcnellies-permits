class EmployeeTrainingsController < ApplicationController
  before_action :set_employee_training, only: [:edit, :update, :destroy]

  def new
    @employee_training = EmployeeTraining.new
  end

  def edit
  end

  def create
    @employee_training = EmployeeTraining.new(employee_training_params)

      if @employee_training.save
        flash[:success] =  "Training Item was successfully added"
        redirect_to site_employee_path(@employee_training.site_employee) 
      else
        flash[:error] =  "Something Horrible has happened in the application. We are taking a look" 
      end
  end

  def update
      if @employee_training.update(employee_training_params)
        flash[:success] =  "Training Item was successfully updated" 
        redirect_to site_employee_path(@employee_training.site_employee) 
      else
        flash[:error] =  "Something Horrible has happened in the application. We are taking a look" 
      end

  end

  def destroy
    @employee_training.destroy
        flash[:success] =  "Training Itme was successfully removed" 
        redirect_to site_employees_path 
  end

  private
    def set_employee_training
      @employee_training = EmployeeTraining.find(params[:id])
    end

    def employee_training_params
      params.require(:employee_training).permit(:site_employee_id, :training_id,:expiration_date, :obtained?)
    end
end

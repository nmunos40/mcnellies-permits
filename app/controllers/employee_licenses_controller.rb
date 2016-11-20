class EmployeeLicensesController < ApplicationController
  before_action :set_employee_license, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  def new
    @employee_license = EmployeeLicense.new
  end

  def edit
  end


  def create
    @employee_license = EmployeeLicense.new(employee_license_params)

      if @employee_license.save
        flash[:success] =  "License was successfully added"
        redirect_to site_employees_path 
      else
        flash[:error] =  "Something Horrible has happened in the application. We are taking a look" 
      end
  end


  def update

      if @employee_license.update(employee_license_params)
        flash[:success] =  "License was successfully updated" 
        redirect_to site_employees_path 
      else
        flash[:error] =  "Something Horrible has happened in the application. We are taking a look" 
      end
  end

  def destroy
    @employee_license.destroy
        flash[:success] =  "License was successfully deleted" 
        redirect_to site_employees_path 
  end

  private

    def set_employee_license
      @employee_license = EmployeeLicense.find(params[:id])
    end

    def employee_license_params
      params.require(:employee_license).permit(:site_employee_id, :license_id, :expiration_date, :obtained?)
    end

end

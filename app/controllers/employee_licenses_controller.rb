class EmployeeLicensesController < ApplicationController
  before_action :set_employee_license, only: [:show, :edit, :update, :destroy]

  def index
    @employee_licenses = EmployeeLicense.all
  end

  def show
  end

  def new
    @employee_license = EmployeeLicense.new
  end

  def edit
  end


  def create
    @employee_license = EmployeeLicense.new(employee_license_params)

    respond_to do |format|
      if @employee_license.save
        format.html { redirect_to @employee_license, notice: 'Employee license was successfully created.' }
        format.json { render :show, status: :created, location: @employee_license }
      else
        format.html { render :new }
        format.json { render json: @employee_license.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @employee_license.update(employee_license_params)
        format.html { redirect_to @employee_license, notice: 'Employee license was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_license }
      else
        format.html { render :edit }
        format.json { render json: @employee_license.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee_license.destroy
    respond_to do |format|
      format.html { redirect_to employee_licenses_url, notice: 'Employee license was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_employee_license
      @employee_license = EmployeeLicense.find(params[:id])
    end

    def employee_license_params
      params.require(:employee_license).permit(:employee_id, :license_id, :expiration_date, :obtained?)
    end
end

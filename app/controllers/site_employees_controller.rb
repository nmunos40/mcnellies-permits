class SiteEmployeesController < ApplicationController
	before_filter :setup_site_employee
	before_filter :authorize

	def new
		@site_employee = SiteEmployee.new
	end

	def create
		@site_employee = SiteEmployee.new(site_employee_params)
		@site_employees = SiteEmployee.all 
		if @site_employee.save
			flash[:success] = "Successfully created the Employee."	
			 redirect_to sites_path
		else
		render :new
		end
	end

	def edit
	end

	def destroy
		@site_employee.destroy
		flash[:success] = "The Employee has been successfully removed."	
		redirect_to root_path
  	end

	def index
		@site_employees = SiteEmployee.all
		
	end

	def update
		if @site_employee.update_attributes(site_employee_params)
			flash[:success] = "Employee updated successfully."
			redirect_to sites_path
		else
			render :edit
		end
	end
	
	private

		def setup_site_employee
			@site_employee = SiteEmployee.find(params[:id]) if params[:id]
		end

		def site_employee_params
			params.require(:site_employee).permit(:first_name, :last_name, :contract_number, :premium, :salaried?, :insurance_type, :coverage_type, :tipped?, :ADP_Deduction, :deduction_amount, :collection_type, :create_date, :employed?, :site_id)
		end
end









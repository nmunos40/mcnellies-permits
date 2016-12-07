class SitesController < ApplicationController
	before_filter :setup_site
	before_filter :authorize
 	helper_method :sort_column, :sort_direction

	def dashboard
		@sites = Site.all
	end

	def new
		@site = Site.new
	end

	def show
		@site = Site.find(params[:id]) if params[:id]
		@site_permits_red = @site.site_permits.less_than_thirty.order(sort_column + " " + sort_direction).paginate(per_page: 25, page:params[:red_page])
		@site_permits_yellow = @site.site_permits.between_thirty_and_ninty.order(sort_column + " " + sort_direction).paginate(per_page: 25, page:params[:yellow_page])
		@site_permits_green = @site.site_permits.greater_than_ninty.order(sort_column + " " + sort_direction).paginate(per_page: 25, page:params[:green_page])
		@site_employees = @site.site_employees.manager!
		@site_managers = @site.site_employees.manager
		@small_employee_licenses = @site.get_emp_lic('small')
		@medium_employee_licenses = @site.get_emp_lic('medium')
		@large_employee_licenses = @site.get_emp_lic('large')
		@small_employee_trainings = @site.get_emp_train('small')
		@medium_employee_trainings = @site.get_emp_train('medium')
		@large_employee_trainings = @site.get_emp_train('large')
	end

	def index
		@sites = Site.search(params[:search]).order(sort_column + " " + sort_direction).paginate(per_page: 25, page:params[:page])
	end

	def create
		@site = Site.new(site_params)
		if @site.save
			flash[:success] = "Successfully created the Site."				
			 redirect_to site_path(@site.id)
		else
		render :new
		end
	end

	def edit
	end

	def update
		if @site.update_attributes(site_params)
			flash[:success] = "Site updated successfully."
			 redirect_to site_path(@site.id)
		else
			render :edit
		end
	end

	private

		def setup_site
			@site = Site.find(params[:id]) if params[:id]
			# Maybe we can catch ALL of the illegal operations elsewhere and present a nice error page
		end

		def site_params
			params.require(:site).permit(:name, :street_address, :fein_number)
		end

		 def sort_column
		    Site.column_names.include?(params[:sort]) ? params[:sort] : "name"
		 end
  
		 def sort_direction
		    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		 end
end
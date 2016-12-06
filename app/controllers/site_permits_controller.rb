class SitePermitsController < ApplicationController
	before_filter :setup_site_permit
	before_filter :authorize
	helper_method :sort_column, :sort_direction

	def new
		@site_permit = SitePermit.new
	end

	def create
		@site_permit = SitePermit.new(site_permit_params)
		@site_permits = SitePermit.all 
		if @site_permit.save
			flash[:success] = "Successfully created the Permit."	
			 redirect_to site_path(@site_permit.site)
		else
		render :new
		end
	end

	def edit
	end

	def destroy
		@site_permit.destroy
		redirect_to home_path
		flash[:success] = "The product has been successfully removed."	
  	end

	def index
		@site_permits_red = SitePermit.less_than_thirty.search(params[:search]).order(sort_column + " " + sort_direction).paginate(per_page: 2, page:params[:red_page])
		@site_permits_yellow = SitePermit.between_thirty_and_ninty.search(params[:search]).order(sort_column + " " + sort_direction).paginate(per_page: 2, page:params[:yellow_page])
		@site_permits_green = SitePermit.greater_than_ninty.search(params[:search]).order(sort_column + " " + sort_direction).paginate(per_page: 2, page:params[:green_page])
	end

	def update
		if @site_permit.update_attributes(site_permit_params)
			flash[:success] = "Permit updated successfully."
			redirect_to site_path(@site_permit.site)
		else
			render :edit
		end
	end

	def export
		@site_permits = SitePermit.all
		respond_to do |format|
			format.html
			format.csv {send_data text: @site_permits.to_csv}
			format.xls { send_data @site_permits.to_csv(col_sep: "\t") }
		end
	end

	private

		def setup_site_permit
			@site_permit = SitePermit.find(params[:id]) if params[:id]
		end

		def site_permit_params
			params.require(:site_permit).permit(:name, :description, :expiration_date, :manager, :site_id, :submitted)
		end

		def sort_column
		    SitePermit.column_names.include?(params[:sort]) ? params[:sort] : "name"
		 end
  
		 def sort_direction
		    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		 end
end

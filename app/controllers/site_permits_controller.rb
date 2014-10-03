class SitePermitsController < ApplicationController
	before_filter :setup_site_permit
	before_filter :authorize

	def new
		@site_permit = SitePermit.new
	end

	def create
		@site_permit = SitePermit.new(site_permit_params)
		@site_permits = SitePermit.all 
		if @site_permit.save
			flash[:success] = "Successfully created the Permit."	
			 redirect_to sites_path
		else
		render :new
		end
	end

	def edit
	end

	def destroy
		@site_permit.destroy
		flash[:success] = "The product has been successfully removed."	
		redirect_to root_path
  	end

	def index
		@site_permits = SitePermit.all
		
	end

	def update
		if @site_permit.update_attributes(site_permit_params)
			flash[:success] = "Permit updated successfully."
			redirect_to sites_path
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
end

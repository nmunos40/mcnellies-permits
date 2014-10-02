class SitesController < ApplicationController
	before_filter :setup_site
	before_filter :authorize
	helper_method :sort_column, :sort_direction

	def new
		@site = Site.new
	end

	def show
		@site = Site.find(params[:id]) if params[:id]
		@site_permits = @site.site_permits.order(sort_column + " " + sort_direction)
	end

	def index
		@sites = Site.all 
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
		    @site.site_permits.column_names.include?(params[:sort]) ? params[:sort] : "name"
		 end
  
		 def sort_direction
		    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		 end
end
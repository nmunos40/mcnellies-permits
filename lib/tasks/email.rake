task :email => :environment do
	if Time.now.monday?
	 	@site_permits = SitePermit.less_than_thirty.unsubmitted.all
	 	unless @site_permits.blank? 
	  		PermitMailer.permit_notification(@site_permits).deliver
		end
	end
end
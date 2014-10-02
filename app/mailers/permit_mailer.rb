class PermitMailer < ActionMailer::Base
  default from: "contact@mcpermits.com"

  def permit_notification(site_permits)
    @site_permits = site_permits

    mail to: "alyvia@mcnellies.com, benjamin-munos@utulsa.edu", subject: "Warning! Permit about to expire!"
  end
end

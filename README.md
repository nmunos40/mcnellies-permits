# Mcnellies Permit Application

 Overview 
=======
| Release                       | Developer     | Release Date  |
| ------------------------------|:-------------:| -------------:|
| 1.0 - Initial Release         |      BCM      |               |
| 1.1 - Development in process  |      BCM      |               |
|                               |               |               |


### Overview 

This applciation was built to track resturaunt licenses. It will track expiring permits for both employees and multiple sites. 


Release Notes
===============

Release Notes - v 1.1
1. Multi tenant application
2. Re-factoring DB to include companies and Tenants
3. Added Site Employees
4. Added Employee Licenses
5. Added employee training
6. Re-factored all dashboards
7. added additional security

Release Notes - V 1.0
1. Emails are currently hard coded. (Eventually will come from the user list)
2. Permits are the only records that can be deleted. (I want to manage deleting of sites and users manually)
3. The application runs on Rails 4 and Ruby 2.1.1
4. Currently the server is still the bric core server. The load is not enough to change at present time.
5. The app is built on bootstrap but the left hand navigation prevents the app from beeing completley mobile compatible.

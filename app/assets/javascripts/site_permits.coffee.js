$('#site_perm_exp').datepicker({ dateFormat: 'yy-mm-dd' });

$(document).ready(function() {

 $('#sitepermit_search').hide(); //Initially form wil be hidden.

  $('#showsitepermits').click(function() {
   $('#sitepermit_search').toggle();//Form shows on button click

   });
 });
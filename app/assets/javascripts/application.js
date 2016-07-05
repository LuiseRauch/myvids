// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(function() {
  $('#series').change(function() {
    if ( $('#series').val() == '' ) {
      $('#new-series-fields').show();
    } else {
      $('#new-series-fields').hide();
    }
  });
});

// $(document).ready(function() {
//   $('#season_id').change(function() {
//     if ( $('#season_id').val() == '' ) {
//       $('#new-season-field').show();
//     } else {
//       $('#new-season-field').hide();
//     }
//   });
// });

$(document).ready(function() {
  $(".is_part_of_series").hide();
  $('#chkSelect').click(function() {
    if ( $('#chkSelect').is(":checked")) {
      $("#is_part_of_season").hide();
      $('.is_part_of_series').show();

    } else {

      $('.is_part_of_series').hide();
    }
  });
});



// $(".checkbox").click(function(){
//    $(this).next("div").toggle();
// });​

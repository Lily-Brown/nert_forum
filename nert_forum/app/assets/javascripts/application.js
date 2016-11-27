// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .
//= require jquery.geocomplete

$( document ).on('turbolinks:load', function() {

  // Edit Comment button on Post#show
  $(document).find('.edit').on('click', function(event) {
    event.preventDefault();
    var toggleClass = '.comment' + this.id;
    $(toggleClass).toggleClass('hide show');
  });

  // Add Post button on Post#index
  $(document).find('.add_post').on('click', function(event) {
    event.preventDefault();
    $('.post').toggleClass('hide show');
  });

  // Add Event button on Post#index
  $(document).find('.add_event').on('click', function(event) {
    event.preventDefault();
    $('.event').toggleClass('hide show');
  });

  // Geocomplete
  $(document).find('#geo-input').geocomplete();

  // Collapsible Posts
  $('.collapsible').collapsible();

  // Fix for Side Nav in Mobile
  $('.button-collapse').sideNav();

});
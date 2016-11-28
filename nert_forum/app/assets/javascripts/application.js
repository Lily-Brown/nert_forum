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
//= require datetimepicker
//= require_tree .
//= require jquery.geocomplete
//= require clockpicker

$( document ).on('turbolinks:load', function() {

  // Fix for Side Nav in Mobile in Application Layout
  $('.button-collapse').sideNav({
    closeOnClick: true
  });

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

  // Collapsible Posts on Post#index
  $('.collapsible').collapsible();

  // Clickable Event Cards on Post#index
  $(document).find('.card').on('click', function(event) {
    event.preventDefault();
    var eventId = this.id;
    window.location.href = '/events/'+eventId;
  });

  // Geocomplete on Event#show and Post#index for Event Location
  $(document).find('#geo-input').geocomplete();

  // DatePicker on Event#show and Post#index for Event Time
  $(document).find('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 15,
    minDate: 0
  });

  // TimePicker on Event#show and Post#index for Event Time
  $(document).find('#timepicker').pickatime({
    autoclose: false,
    twelvehour: true
  });

  // Sticky Aside for User#show
  $(document).find('#aside').pushpin({ top:110 });

});
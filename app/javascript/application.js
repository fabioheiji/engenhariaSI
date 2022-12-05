//= require jquery
//= require jquery_ujs
// = require leaflet

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

$(document).ready(() => {
  $("#copy-to-clipboard").click(() => {
    navigator.clipboard.writeText(location.href);
    $("#tooltip").css("display", "block");
    setTimeout(() => {
      $("#tooltip").css("display", "none");
    }, 3000);
  });
});

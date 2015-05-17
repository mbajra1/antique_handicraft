
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.js
//= require turbolinks
//= require_tree .


$(function() {
    if ($("#bids").length > 0) {
        setTimeout(updateComments, 10000);
    }
});

function updateComments () {
    var cart_id = $("#bid_cart").attr("data-id");
    if ($(".bid").length > 0) {
        var after = $(".bid:last-child").attr("data-time");
    } else {
        var after = "0";
    }
    $.getScript("/bid_actions.js?cart_id=" + cart_id + "&after=" + after)
    setTimeout(updateComments, 10000);
}
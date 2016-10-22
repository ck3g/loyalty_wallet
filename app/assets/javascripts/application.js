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
//= require jquery.lazyload
//= require jquery_ujs
//= require bootstrap
//= require_tree .

var NAVBAR_ACTIVE_CLASSNAME = 'navbar--active'
var ALERTS_FADEOUT_DELAY_MS = 2500

$(document).ready(function () {
  initLazyload()
  initAlerts()

  bindEvents()
})

function initAlerts () {
  setTimeout(function () {
    $('.alert-success').alert('close')
  }, ALERTS_FADEOUT_DELAY_MS)
}

function initLazyload () {
  $('img').lazyload()
}

function changeNavbarClassname () {
  $('.navbar').toggleClass(NAVBAR_ACTIVE_CLASSNAME, $(window).scrollTop() > 200)
}

function bindEvents () {
  $(window).on('scroll', changeNavbarClassname)
}

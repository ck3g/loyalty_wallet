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
//= require chartist
//= require chartist-plugin-axistitle
//= require jquery_ujs
//= require bootstrap
//= require_tree .

var NAVBAR_ACTIVE_CLASSNAME = 'navbar--active'
var ALERTS_FADEOUT_DELAY_MS = 2500

$(document).ready(function () {
  initLazyload()
  initAlerts()
  initUsersPerDayChart()
  initUsersPerStampChart()
  initModals()

  bindEvents()
})

var range = function (low, high) {
  var list = []

  for (var i = low; i <= high; i++) list.push(i)

  return list
}

function initModals () {
  var freeStuffModal = $("#free-stuff-modal")

  if (freeStuffModal.length) {
    freeStuffModal.modal('show')
  }
}

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

function initUsersPerDayChart () {
  var chart = $('#users-per-day-chart')

  if (chart.length === 0) return

  var jsonData = chart.data('data')

  var data = {
    labels: jsonData.map(function (stamp) {
      return stamp.date.split('-').slice(1).reverse().join('.')
    }),
    series: [
      jsonData.map(function (stamp) { return stamp.count })
    ]
  }

  var options = {
    chartPadding: {
      top: 20,
      right: 10,
      bottom: 30,
      left: 20
    },
    axisY: {
      type: Chartist.AutoScaleAxis,
      onlyInteger: true
    },
    plugins: [
      Chartist.plugins.ctAxisTitle({
        axisX: {
          axisTitle: 'Date',
          axisClass: 'ct-axis-title',
          offset: {
            x: 0,
            y: 40
          },
          textAnchor: 'middle'
        },
        axisY: {
          axisTitle: 'Stamps',
          axisClass: 'ct-axis-title',
          offset: {
            x: 0,
            y: 20
          },
          textAnchor: 'middle',
          flipTitle: true
        }
      })

    ]

  }

  new Chartist.Line('#users-per-day-chart', data, options)
}

function initUsersPerStampChart () {
  var chart = $('#users-per-stamp-chart')

  if (chart.length === 0) return

  var jsonData = chart.data('data')

  var stamps = range(1, 10)
  var data = {
    labels: stamps,
    series: [
      stamps.map(function (s) { return jsonData[s] || 0 })
    ]
  }

  var options = {
    chartPadding: {
      top: 20,
      right: 10,
      bottom: 30,
      left: 20
    },
    axisY: {
      type: Chartist.AutoScaleAxis,
      onlyInteger: true
    },
    plugins: [
      Chartist.plugins.ctAxisTitle({
        axisX: {
          axisTitle: 'Stamps Amount',
          axisClass: 'ct-axis-title',
          offset: {
            x: 0,
            y: 40
          },
          textAnchor: 'middle'
        },
        axisY: {
          axisTitle: 'Customers',
          axisClass: 'ct-axis-title',
          offset: {
            x: 0,
            y: 20
          },
          textAnchor: 'middle',
          flipTitle: true
        }
      })

    ]
  }

  new Chartist.Bar('#users-per-stamp-chart', data, options).on('draw', function (data) {
    if (data.type === 'bar') {
      data.element.attr({ style: 'stroke-width: 30px' })
    }
  })
}

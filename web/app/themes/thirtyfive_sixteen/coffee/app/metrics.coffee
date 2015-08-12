$ = require 'jquery'
Fingerprint2 = require 'fingerprintjs2'
waypoints = require("script!../../node_modules/waypoints/lib/noframework.waypoints.js")

console.log waypoints

init = ->
  new Fingerprint2().get (result)->
    amplitude.setUserId result

  $('a').on 'click', handleClick

handleClick = (event)->
  $self = $(this)

  identifier = ["click", "on", $self.text(), "link"].join("_").toUpperCase().replace(/\s/, '_')

  payload =
    text: $self.text()
    url: $self.attr('src')

  amplitude.logEvent identifier, payload

init()
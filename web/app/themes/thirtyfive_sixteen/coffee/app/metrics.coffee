$ = require 'jquery'
Fingerprint2 = require 'fingerprintjs2'

amplitude = require './metrics/amplitude'
googleAnalytics = require './metrics/ga'

init = ->
  new Fingerprint2().get (fingerprint)->
    ga 'set', 'userId', fingerprint
    amplitude.user fingerprint

  $('a').on 'click', handleClick

handleClick = (event)->
  $self = $(this)

  identifier = ["click", "on", $self.text(), "link"].join("_").toUpperCase().replace(/\s/, '_')

  payload =
    text: $self.text()
    url: $self.attr 'href'

  amplitude.track identifier, payload
  ga('send', 'event', 'click', 'link', payload.url)

  event.preventDefault()

init()
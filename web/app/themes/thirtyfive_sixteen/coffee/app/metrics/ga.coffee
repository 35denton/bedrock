# ga.coffee

analytics = {}

analytics.track = (type, label, value)->
  ga 'send', 'event', type, label, value

module.exports = analytics
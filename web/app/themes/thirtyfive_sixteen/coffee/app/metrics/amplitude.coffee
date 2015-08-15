# amplitude.coffee

amp = {}

amp.user = (identifier)->
	amplitude.setUserId identifier

amp.log = (identifier, payload = {})->
	amplitude.logEvent identifier, payload

module.exports = amp
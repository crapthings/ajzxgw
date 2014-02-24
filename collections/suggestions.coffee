@Suggestions = new Meteor.Collection 'suggestions'

Suggestions.before.insert (userId) -> return false unless userId

Suggestions.before.insert (userId, suggestion) ->
	_.extend suggestion,
		completed: false
		creatorId: userId
		createdAt: new Date()
		timestamp: Date.now()

Meteor.methods

	newSuggestion: (options) ->
		Suggestions.insert options

	removeSuggestion: (suggestionId) ->
		Suggestions.remove suggestionId

if Meteor.isServer

	Meteor.publish 'uncompletedSuggestionsList', ->
		Suggestions.find { completed: false },
			sort:
				timestamp: -1
			limit: 100

	Meteor.publish 'suggestion', (suggestionId) ->
		Suggestions.find { _id: suggestionId }

@Comments = new Meteor.Collection 'comments'

Meteor.methods

	newComment: (options) ->
		Comments.insert options

if Meteor.isServer

	Meteor.publish 'comments', (suggestionId) ->
		Comments.find { suggestionId: suggestionId },
			sort:
				timestamp: -1

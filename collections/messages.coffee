@Messages = new Meteor.Collection 'messages'

Messages.before.insert (userId, message) ->
	_.extend message,
		answered: false
		createdAt: new Date()
		timestamp: Date.now()

Meteor.methods

	newMessage: (options) ->
		Messages.insert options

	removeMessage: (messageId) ->
		Messages.remove messageId

if Meteor.isServer

	Meteor.publish 'latestPublicMessage', ->
		Messages.find {},
			sort:
				timestamp: -1
			limit: 50

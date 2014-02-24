@Messages = new Meteor.Collection 'messages'

Messages.before.insert (userId, message) ->
	if userId
		_.extend message,
			answered: false
			creatorId: userId
			createdAt: new Date()
			timestamp: Date.now()
	else
		_.extend message,
			answered: false
			createdAt: new Date()
			timestamp: Date.now()

Messages.before.remove (userId, message) ->
	return false if userId isnt message.creatorId and Meteor.user().role isnt 'administrator'
	return false if message.answered is true

Meteor.methods

	newMessage: (options) ->
		Messages.insert options

	removeMessage: (messageId) ->
		Messages.remove messageId

	answerMessage: (messageId, content) ->
		Messages.update messageId,
			$set:
				answer: content
				answered: true
				answeredAt: new Date()

if Meteor.isServer

	Meteor.publish 'latestPublicMessage', ->
		Messages.find {},
			sort:
				timestamp: -1
			limit: 200

	Meteor.publish 'unansweredMessagesList', ->
		Messages.find { answered: false },
			sort:
				timestamp: -1

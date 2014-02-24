@Talks = new Meteor.Collection 'talks'

Talks.before.insert (userId) -> return false unless userId

Talks.before.update (userId, talk) ->
	return false if userId isnt talk.creatorId and Meteor.user().role isnt 'administrator'

Talks.before.remove (userId, talk) ->
	return false if userId isnt talk.creatorId and Meteor.user().role isnt 'administrator'
	return false if talk.answered is true

Talks.before.insert (userId, talk) ->
	_.extend talk,
		answered: false
		creatorId: userId
		createdAt: new Date
		timestamp: Date.now()

Meteor.methods

	newTalk: (options) ->
		Talks.insert options

	removeTalk: (talkId) ->
		Talks.remove talkId

	answerTalk: (talkId, content) ->
		Talks.update talkId,
			$set:
				answer: content
				answered: true
				answeredAt: new Date()

if Meteor.isServer

	Meteor.publish 'myTalksList', ->
		Talks.find { creatorId: @userId },
			sort:
				timestamp: -1

	Meteor.publish 'unansweredTalksList', ->
		Talks.find { answered: false },
			sort:
				timestamp: -1

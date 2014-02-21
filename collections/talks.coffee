@Talks = new Meteor.Collection 'talks'

Talks.before.insert (userId) -> return false unless userId

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

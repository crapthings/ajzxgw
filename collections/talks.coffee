@Talks = new Meteor.Collection 'talks'

Talks.before.insert (userId) -> return false unless userId

Talks.before.insert (userId, talk) ->
	_.extend talk,
		creatorId: userId
		createdAt: new Date
		timestamp: Date.now()

if Meteor.isServer

	Meteor.publish 'myTalksList', ->
		Talks.find { creatorId: @userId },
			sort:
				timestamp: -1

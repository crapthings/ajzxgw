@Notices = new Meteor.Collection 'notices'

Notices.before.insert (userId, notice) ->
	_.extend notice,
		creatorId: userId
		createdAt: new Date()
		timestamp: Date.now()

Meteor.methods

	newNotice: (options) ->
		Notices.insert options

	removeNotice: (noticeId) ->
		Notices.remove noticeId

if Meteor.isServer

	Meteor.publish '', ->
		Notices.find {},
			sort:
				timestamp: -1
			limit: 20

	Meteor.publish 'notice', (noticeId) ->
		Notices.find { _id: noticeId }

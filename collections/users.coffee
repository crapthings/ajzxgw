@Users = Meteor.users

Users.before.insert (userId, user) ->
	if user.username is 'admin'
		_.extend user,
			role: 'administrator'
	else
		_.extend user,
			role: 'user'

if Meteor.isServer

	Meteor.publish '', ->
		Users.find { _id: @userId },
			fields:
				services: false

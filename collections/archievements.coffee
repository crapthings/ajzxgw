@Achievements = new Meteor.Collection 'achievements'

Meteor.methods

	newAchievement: (options) ->
		Achievements.insert options

if Meteor.isServer

	Meteor.publish 'achievements', ->
		Achievements.find {},
			sort:
				createdAt: -1

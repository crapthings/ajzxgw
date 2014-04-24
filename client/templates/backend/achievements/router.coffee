Router.map ->
	@route 'backendAchievements',
		layoutTemplate: 'backend-layout'
		path: '/backend/achievements'
		data: ->
			achievements: Achievements.find {},
				sort:
					createdAt: -1
		onBeforeAction: [
			->
				@subscribe('achievements').wait()
		]

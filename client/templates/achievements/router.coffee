Router.map ->
	@route 'achievements',
		path: '/achievements'
		data: ->
			achievements: Achievements.find {},
				sort:
					createdAt: -1
		onBeforeAction: [
			->
				@subscribe('achievements').wait()
		]

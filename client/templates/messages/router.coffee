Router.map ->
	@route 'messages',
		path: '/messages'
		data: ->
			messages: Messages.find {},
				sort:
					timestamp: -1
				limit: 50
		onBeforeAction: [
			->
				@subscribe('latestPublicMessage').wait()
		]

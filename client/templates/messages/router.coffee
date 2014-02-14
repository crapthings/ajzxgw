Router.map ->
	@route 'messages',
		path: '/messages'
		data: ->
			messages: Messages.find {},
				sort:
					timestamp: -1
				limit: 50
		before: [
			->
				@subscribe('latestPublicMessage').wait()
		]

Router.map ->
	@route 'backendMessagesUnanswered',
		layoutTemplate: 'backend-layout'
		path: '/backend/messages/unanswered'
		data: ->
			unansweredMessagesList: Messages.find { answered: false },
				sort:
					timestamp: -1
		onBeforeAction: [
			->
				@subscribe('unansweredMessagesList').wait()
		]

Router.map ->
	@route 'backend-messages-unanswered',
		layoutTemplate: 'backend-layout'
		path: '/backend/messages/unanswered'
		data: ->
			unansweredMessagesList: Messages.find { answered: false },
				sort:
					timestamp: -1
		before: [
			->
				@subscribe('unansweredMessagesList').wait()
		]

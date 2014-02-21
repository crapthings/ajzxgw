Router.map ->
	@route 'backend-talks-unanswered',
		layoutTemplate: 'backend-layout'
		path: '/backend/talks/unanswered'
		data: ->
			unansweredTalksList: Talks.find { answered: false },
				sort:
					timestamp: -1
		before: [
			->
				@subscribe('unansweredTalksList').wait()
		]

Router.map ->
	@route 'backendTalksUnanswered',
		layoutTemplate: 'backend-layout'
		path: '/backend/talks/unanswered'
		data: ->
			unansweredTalksList: Talks.find { answered: false },
				sort:
					timestamp: -1
		onBeforeAction: [
			->
				@subscribe('unansweredTalksList').wait()
		]

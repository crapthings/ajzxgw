Router.map ->
	@route 'talks',
		path: '/talks'
		data: ->
			myTalksList: Talks.find { creatorId: Meteor.userId() },
				sort:
					timestamp: -1
		onBeforeAction: [
			->
				unless Meteor.userId()
					Router.go 'sign'
					@stop()
			->
				@subscribe('myTalksList').wait()
		]

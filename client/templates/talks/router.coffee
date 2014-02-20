Router.map ->
	@route 'talks',
		path: '/talks'
		data: ->
			myTalksList: Talks.find { creatorId: Meteor.userId() },
				sort:
					timestamp: -1
		before: [
			->
				@subscribe('myTalksList').wait()
			->
				unless Meteor.userId()
					Router.go Router.routes['sign'].path()
					@stop()
		]

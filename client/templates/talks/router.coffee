Router.map ->
	@route 'talks',
		path: '/talks'
		data: ->
			myTalksList: Talks.find { creatorId: Meteor.userId() },
				sort:
					timestamp: -1
		before: [
			->
				unless Meteor.userId()
					Router.go Router.routes['sign'].path()
					@stop()
			->
				@subscribe('myTalksList').wait()
		]

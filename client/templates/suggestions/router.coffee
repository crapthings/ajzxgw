Router.map ->
	@route 'suggestions',
		path: '/suggestions'
		data: ->
			uncompletedSuggestionsList: Suggestions.find { completed: false },
				sort:
					timestamp: -1
		before: [
			->
				@subscribe('uncompletedSuggestionsList').wait()
		]

	@route 'viewSuggestion',
		path: '/suggestions/:_id/view'
		data: ->
			suggestion: Suggestions.findOne @params._id
			comments: Comments.find { suggestionId: @params._id },
				sort:
					timestamp: -1
		before: [
			->
				unless Meteor.userId()
					Router.go Router.routes['sign'].path()
				@stop()
			->
				@subscribe('suggestion', @params._id).wait()
				@subscribe('comments', @params._id)
		]

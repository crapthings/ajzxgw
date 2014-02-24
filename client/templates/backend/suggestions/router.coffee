Router.map ->
	@route 'backend-suggestions-uncompleted',
		layoutTemplate: 'backend-layout'
		path: '/backend/suggestions/uncompleted'
		data: ->
			uncompletedSuggestionsList: Suggestions.find { completed: false },
				sort:
					timestamp: -1
				limit: 100
		before: [
			->
				@subscribe('uncompletedSuggestionsList').wait()
		]

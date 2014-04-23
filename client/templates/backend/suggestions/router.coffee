Router.map ->
	@route 'backendSuggestionsUncompleted',
		layoutTemplate: 'backend-layout'
		path: '/backend/suggestions/uncompleted'
		data: ->
			uncompletedSuggestionsList: Suggestions.find { completed: false },
				sort:
					timestamp: -1
				limit: 100
		onBeforeAction: [
			->
				@subscribe('uncompletedSuggestionsList').wait()
		]

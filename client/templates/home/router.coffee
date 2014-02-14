Router.map ->
	@route 'home',
		path: '/'
		data: ->
			notices: Notices.find {},
				sort:
					timestamp: -1

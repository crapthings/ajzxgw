Router.map ->
	@route 'backend-notices',
		layoutTemplate: 'backend-layout'
		path: '/backend/notices'
		data: ->
			notices: Notices.find {},
				sort:
					timestamp: -1

	@route 'backend-notices-new',
		layoutTemplate: 'backend-layout'
		path: '/backend/notices/new'

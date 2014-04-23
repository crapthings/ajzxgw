Router.map ->
	@route 'backendNotices',
		layoutTemplate: 'backend-layout'
		path: '/backend/notices'
		data: ->
			notices: Notices.find {},
				sort:
					timestamp: -1

	@route 'backendNoticesNew',
		layoutTemplate: 'backend-layout'
		path: '/backend/notices/new'

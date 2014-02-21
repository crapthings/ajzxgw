Router.map ->
	@route 'viewNotice',
		path: '/notices/:_id'
		data: ->
			notice: Notices.findOne { _id: @params._id }
		before: [
			->
				@subscribe('notice').wait()
		]

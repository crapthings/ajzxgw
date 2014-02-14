Template['btn-submit'].events
	'click': (e, t) ->
		e.preventDefault()
		helper = ($ '[data-helper]').data()
		options = form2js helper.form
		if @_id
			Meteor.call helper.method, options, @_id, (err) ->
				unless err
					Router.go Router.routes[helper.redirect].path()
		else
			Meteor.call helper.method, options, (err) ->
				unless err
					Router.go Router.routes[helper.redirect].path()

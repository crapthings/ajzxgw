Template.signin.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		options = form2js 'signinForm'
		Meteor.loginWithPassword options.username, options.password, (err) ->
			unless err
				Router.go Router.routes['talks'].path()

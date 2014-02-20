Template.signup.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		options = form2js 'signupForm'
		Accounts.createUser options, (err) ->
			unless err
				Router.go Router.routes['talks'].path()

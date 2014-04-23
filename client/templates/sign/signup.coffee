Template.signup.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		options = form2js 'signupForm'
		Accounts.createUser options, (err) ->
			unless err
				Router.go 'talks'
			else
				alert '注册失败。'

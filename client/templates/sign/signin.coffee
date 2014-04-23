Template.signin.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		options = form2js 'signinForm'
		Meteor.loginWithPassword options.username, options.password, (err) ->
			unless err
				Router.go 'talks'
			else
				alert '登录失败，请重试。'

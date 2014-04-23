Template['backendSignin'].events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		username = ($ '#username').val()
		password = ($ '#password').val()
		Meteor.loginWithPassword username, password, (err) ->
			unless err
				Router.go 'backend'
			else
				alert '登录错误。'

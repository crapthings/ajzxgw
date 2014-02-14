Template.fastMessageForm.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		options = form2js 'fastMessageForm'
		Meteor.call 'newMessage', options

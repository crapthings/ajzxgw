Template.fastTalkForm.events
	'form submit': (evt, tmpl) ->
		evt.preventDefault()
		options = form2js 'fastTalkForm'
		Meteor.call 'newTalk', options

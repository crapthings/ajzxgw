Template.fastTalkForm.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		options = form2js 'fastTalkForm'
		Meteor.call 'newTalk', options, (err) ->
			unless err
				($ tmpl.find '.reset').trigger 'click'
				($ 'textarea').height 'auto'

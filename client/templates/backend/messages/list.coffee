Template.unansweredMessageItem.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		answer = ($ tmpl.find 'textarea[name="content"]').val()
		Meteor.call 'answerMessage', @_id, answer

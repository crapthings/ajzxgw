Template.unansweredTalkItem.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		answer = ($ tmpl.find 'textarea[name="content"]').val()
		console.log answer
		Meteor.call 'answerTalk', @_id, answer

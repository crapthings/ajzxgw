Template.fastSuggestionForm.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		options = form2js 'fastSuggestionForm'
		Meteor.call 'newSuggestion', options, (err) ->
			unless err
				($ tmpl.find '.reset').trigger 'click'

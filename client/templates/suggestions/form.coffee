Template.fastCommentForm.events
	'submit form': (evt, tmpl) ->
		evt.preventDefault()
		options = form2js 'fastCommentForm'
		options.suggestionId = @_id
		Meteor.call 'newComment', options, (err) ->
			unless err
				($ tmpl.find '.reset').trigger 'click'

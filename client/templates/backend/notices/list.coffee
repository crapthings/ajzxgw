Template['backend-notices-item'].events
	'click .remove': (evt, tmpl) ->
		evt.preventDefault()
		Meteor.call 'removeNotice', @_id

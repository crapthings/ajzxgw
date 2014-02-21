Template.myTalksItem.events
	'click .remove': (evt, tmpl) ->
		evt.preventDefault()
		Meteor.call 'removeTalk', @_id

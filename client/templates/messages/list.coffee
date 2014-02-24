Template.messagesItem.events
	'click .remove': (evt, tmpl) ->
		evt.preventDefault()
		cfm = confirm '确定要删除吗?'
		if cfm
			Meteor. call 'removeMessage', @_id

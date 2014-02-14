Meteor.startup ->

	isAdminExist = Meteor.users.findOne { username: 'admin' }

	unless isAdminExist

		Accounts.createUser
			username: 'admin'
			password: 'aijian'

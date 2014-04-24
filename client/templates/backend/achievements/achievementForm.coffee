Template.achievementForm.events
	'submit form': (e ,t) ->
		e.preventDefault()
		options = form2js 'achievementForm'
		Meteor.call 'newAchievement', options, (err) ->
			unless err
				($ t.find '.reset').trigger 'click'
				($ '.preview-box').empty()

	'change .pick-image': (e, t) ->
		images = FileAPI.getFiles(e)
		_.each images, (image) ->
			FileAPI.upload
				url: 'http://1.58.67.62:8081/api/upload/image'
				files:
					file: image
				complete: (err, xhr) ->
					unless err
						$input = ($ '<input type="hidden" name="images[]" />').val((EJSON.parse xhr.response).filename)
						($ '.images').append $input

						($ '.preview-box').append( ($ '<img style="height: 120px;" />').attr 'src', 'http://localhost:8081/uploads/' + (EJSON.parse xhr.response).filename)

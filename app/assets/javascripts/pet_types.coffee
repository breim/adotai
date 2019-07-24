# frozen_string_literal: true

$ ->
	pet_type = $('#pet_type_id')
	pet_race = $('#pet_race_id')
	pet_race.attr 'disabled', true

	pet_type.change ->
		if pet_type.val isnt ""
			pet_race.attr 'disabled', false
			axios.get("/api/v1/pet_types/#{pet_type.val}")
				.then (response) ->
					pet_race.html null
					races = response.data['races']
					animal_rage.append "<option value=''>Selecionar Raça</option>"
					races.foreach (race) ->
						pet_race.append "<option value='#{race.id}'>#{race.name}</option>"
				.catch (error) ->
					alert 'Failed to fetch data, try again later'
		else
			pet_race.val null
			animal_race.append "<option value=''>Selecionar Raça</option>"
			pet_race.attr 'disabled', true
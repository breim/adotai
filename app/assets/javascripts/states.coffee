# frozen_string_literal: true

$ ->
	state_field = $('#profile_state_id')
	city_field  = $('#profile_city_id')
	city_field.attr 'disabled', true

	state_field.change ->
		if state_field.val isnt ""
			city_field.attr 'disabled', false
			axios.get("/api/v1/states/#{state_field.val}")
				.then (response) ->
					city_field.html null
					cities = response.data['data']
					city_field.append "<option value=''>Selecionar Cidade</option>"
					cities.foreach (city) ->
						city_field.append "<option value='#{city.id}'>#{city.name}</option>"
				.catch (error) ->
					alert 'Failed to fetch data, try again later'
		else
			city_field.val null
			city_field.append "<option value=''>Selecionar Cidade</option>"
			city_field.attr 'disabled', true
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

this.StopWatch = (currentTime) ->
	$stopwatch = $('#timer')
	incrementTime = 70
	updateEvery = 15
	postCounter = 0
	updateTimer = ->
		$stopwatch.html(formatTime(currentTime))
		currentTime += incrementTime / 10
		postCounter += 1
		if postCounter % parseInt(updateEvery * 1000 / incrementTime) == 0
			updateServer({ id: 1, timer: currentTime, name: "Rails" })
			postCounter = 0
	this.update = ->
		updateServer({ id: 1, timer: currentTime, name: "Rails" })
	init = ->
		StopWatch.Timer = $.timer(updateTimer, incrementTime, true)
	$(init)
	this

this.updateServer = (jsonObject) ->
	$.ajax({
		url: window.location.pathname + ".json",
		contentType: "application/json",
		type: "PUT",
		dataType: 'json'
		data: JSON.stringify(jsonObject)
	})

pad = (number, length) ->
	str = '' + number
	while str.length < length
		str = '0' + str
	# fill in the thousands
	pattern = /(-?\d+)(\d{3})/
	while pattern.test(str)
		str = str.replace(pattern, "$1,$2")
	str


formatTime = (time) ->
	sec = parseInt(time / 100) % 60
	min = parseInt(time / (60 * 100) % 60)
	hour = parseInt(time / (60 * 60 * 100))
	hundredths = parseInt(time - (sec * 100) - (min * (60 * 100)) - (hour * (3600 * 100)))
	pad(hour, 5) + ":" + pad(min, 2) + ":" + pad(sec, 2) + ":" + pad(hundredths, 2)
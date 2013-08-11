# $->
# 	$('.pushRight').on "click", ->
# 		$(".sidebar").toggle ".is-displayed"
# 		$(".wrap").toggle "sidebar-is-displayed"

$(document).ready ->
	$(".pushRight").on "click", ->
		$(".sidebar").toggleClass "is-pushing"
		$("body").toggleClass "sidebar-is-pushing"
$(document).ready(function () {
	window.setTimeout(function () {
		$(".loading").fadeOut(500)
	}, 400)
	$(".luntop1").luntopFn({
		time: 25
	});
//	$(".luntop2").luntopFn({
//		time: 25
//	});
	$(".cha").click(function () {
		$(".kef").hide();
	});
  $(".chacha").click(function () {
		$(".tanchuceng").hide();
	});
  
	$(".chag").click(function () {
		$(".gonggao").hide();
	});
	$(".xiao").click(function () {
		$(".gonggao").toggleClass("cur");
	});
})

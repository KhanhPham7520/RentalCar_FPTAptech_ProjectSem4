
/****************active menutop*****/
$(document).ready(function(){
	$('.menu-nav li').click(function(){
		$('.menu-nav li').removeClass('active');
			$(this).addClass('active');
			});
});
/*****************active menu left*************/
$(document).ready(function(){
	$('.module-categories li').click(function(){
		$('.module-categories li').removeClass('active');
			$(this).addClass('active');
			});
});
/*****************active menu left*************/
$(document).ready(function(){
	$('#footer ul li').click(function(){
		$('#footer ul li').removeClass('active');
			$(this).addClass('active');
			});
});
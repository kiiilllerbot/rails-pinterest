//= require jquery3
//= require jquery.turbolinks
//= require rails-ujs
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require masonry/jquery.masonry
//= require turbolinks
//= require_tree .

$(document).ready(function (){
	setTimeout(function(){
		$('#notice_wrapper').fadeOut("slow",function(){
			$(this).remove();
		})
	},3500);
});
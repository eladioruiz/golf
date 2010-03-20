jQuery(document).ready(function() {

	/*
	*   Examples - various
	*/

	$("#various1").fancybox({
		'titlePosition'		: 'inside',
		'transitionIn'		: 'none',
		'transitionOut'		: 'none'
	});

	$("#various2").fancybox({
		'modal' : true
	});

	$("#various3").fancybox({
		ajax : {
		    type	: "POST",
		    data	: 'mydata=test'
		}
	});

	$("#various4").fancybox({
		ajax : {
		    type	: "POST"
		}
	});

	$("#various5").fancybox({
		'width'				: '75%',
		'height'			: '75%',
        'autoScale'     	: false,
        'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'type'				: 'iframe'
	});

	$("#various6").fancybox({
	    'padding'           : 0,
        'autoScale'     	: false,
        'transitionIn'		: 'none',
		'transitionOut'		: 'none'
	});

	$("#various7").fancybox({
		onStart		:	function() {
			return window.confirm('Continue?');
		},
		onCancel	:	function() {
			alert('Canceled!');
		},
		onComplete	:	function() {
            alert('Completed!');
		},
		onCleanup	:	function() {
            return window.confirm('Close?');
		},
		onClosed	:	function() {
            alert('Closed!');
		}
	});

	$("#various8, #various9").fancybox();

});

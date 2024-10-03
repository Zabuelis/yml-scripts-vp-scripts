/*!
 * jQuery Cookie Policy Plugin
 */
(function($) {
$.fn.cookiepolicy = function(options) {
    new jQuery.cookiepolicy($(this), options);
	return this;
};

$.cookiepolicy = function(options) {
    if (cookie_text === undefined || cookie_text === null) {
        cookie_text = "";
    }

    options = $.extend({
            cookie: 'cookiepolicyinfo',
            info: cookie_text,
            close: '<i class="fa fa-times" aria-hidden="true"></i> sutinku'
    }, options || {});
	
    if($.cookie(options.cookie) != 'true' && $.cookie(options.info) != '') {
		var host = $(location).attr('host');
		// alert(host);
        var wrapper = $('<div/>').addClass('cookiepolicy').appendTo('body');
        $('<span/>').html(options.info).append("<a href='http://"+ host +"/slapuku-politika' target='_blank'>slapukų politika</a>").appendTo(wrapper)
        $('<a/>').addClass('button').html(options.close).appendTo(wrapper)
            .on('click', function(e) {
                e.preventDefault();
                $.cookie(options.cookie, true);
                $(this).parents('.cookiepolicy').remove();
            });
    }
};
})(jQuery);
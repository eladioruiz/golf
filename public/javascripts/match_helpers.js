
var MatchHelper = function() {
    function increment_last_number(string) {
        var last_number_regexp = /(\d+)(.*?)$/;
        var match = string.match(last_number_regexp);
        var last_number = match[1];
        var next_number = parseInt(last_number) + 1;
        return string.replace(last_number_regexp, "" + next_number + "$2");
    }

    function increment_last_number_in_attribute(element, attribute) {
        element.each(function() {
            if($(this).attr(attribute)) {
                $(this).attr(attribute, increment_last_number($(this).attr(attribute)));
            }
        });
    }

    return {
        onRemovePlayer: function() {
			var div_player = $(this).closest("div.playermatch");
			div_player.find("input[type=hidden]").attr("value","1");
			div_player.hide();
        },
        onAddPlayer: function() {
            var div = $(this).parent().siblings("div.playermatch:last");
            var clone = div.clone().attr('name', 'new');

            increment_last_number_in_attribute(clone.find("label"), "for");
            increment_last_number_in_attribute(clone.find("select"), "id");
            increment_last_number_in_attribute(clone.find("select"), "name");
            increment_last_number_in_attribute(clone.find("input"), "name");
				
            console.log(clone);
            clone.find("input").attr("value","0");
            clone.show();

            div.after(clone);
        }
    }
}();



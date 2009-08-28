
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
            var div = $(this).closest("div.playermatch");
            var hidden_field = div.find("input[type=text]");
            hidden_field.attr('value','1');
            //console.log(hidden_field)
            //console.log(hidden_field.value);
            //console.log(hidden_field);
            //hidden_field.value = '1';
            //alert(hidden_field.value);
            div.hide();
        },
        onAddPlayer: function() {
            var div = $(this).parent().siblings("div.playermatch:last");
            console.log(div);
            var clone = div.clone().attr('name', 'new');
            increment_last_number_in_attribute(clone.find("label"), "for");
            increment_last_number_in_attribute(clone.find("select"), "id");
            increment_last_number_in_attribute(clone.find("select"), "name");
            increment_last_number_in_attribute(clone.find("input"), "name");
            div.after(clone);
        }
    }
}();

$(document).ready(function(){
    $("form a.remove")
    .click(MatchHelper.onRemovePlayer);
    $("form a.add_player")
    .click(MatchHelper.onAddPlayer);
});


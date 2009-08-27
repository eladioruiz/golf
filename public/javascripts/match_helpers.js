
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
            $(this).closest("div.playermatch[name='new']").remove();
        },
        onAddPlayer: function() {
            var div = $(this).parent().siblings("div.playermatch:last");
            console.log(div);
            var clone = div.clone().attr('name', 'new');
            increment_last_number_in_attribute(clone.find("label"), "for");
            increment_last_number_in_attribute(clone.find("select"), "id");
            increment_last_number_in_attribute(clone.find("select"), "name");
            if (!clone.find("p.remove a").length) clone.append('<p class="remove"><a href="#">Remove</a></p>');
            clone.find("p.remove a").click(MatchHelper.onRemoveField);
            div.after(clone);
        }
    }
}();

$(document).ready(function(){
    $("form p.remove")
    .html("<a href='#'>Remove</a>")
    .find("a").click(MatchHelper.onRemovePlayer);
    $("form a.add_player")
    .click(MatchHelper.onAddPlayer);
});


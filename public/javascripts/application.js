// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function(){
    $("form p a.remove")
    .click(MatchHelper.onRemovePlayer);
    $("form p a.add_player")
    .click(MatchHelper.onAddPlayer);

    $('.kwicks').kwicks({
        min : 110,
        spacing : 10
    });

});
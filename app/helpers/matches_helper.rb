module MatchesHelper
  def link_to_card(player)
    if !player.has_card?
				"<a class=\"new_card\" href=\"/matches/#{player.match_id}/players/#{player.id}/cards/new\">New Card</a>"
		else
				"<a class=\"new_card\" href=\"/matches/̣#{player.match_id}/players/#{player.id}/cards/#{player.card.id}/edit\">Edit Card</a>"
		end
  end

  def link_to_remove_card(player)
    if player.has_card?
      link_to 'Delete', player.card, :confirm => '¿Está seguro?', :method => :delete
			#"<a class=\"new_card\" href=\"/matches/̣#{player.match_id}/players/#{player.id}/cards/#{player.card.id}/delete\">Remove Card</a>"
		end
  end
  
  def print_match_path(match)
    "/matches/#{match.id}/print"
  end
end

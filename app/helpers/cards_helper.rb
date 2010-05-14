module CardsHelper
  def print_card_path(card)
    "/cards/#{card.id}/print"
  end
end

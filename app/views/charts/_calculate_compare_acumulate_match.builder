
xml = Builder::XmlMarkup.new
xml.graph(  :caption            =>'<u>Partido comparado (acumulado)</u>: ' + match.course.name + ' ' + format_date(match.date_hour_match),
            :xAxisName          =>'Hoyos',
            :yAxisName          =>'Golpes Acumulados',
            :hovercapbg         =>'FFECAA',
            :hovercapborder     =>'F47E00',
            :formatNumberScale  =>'0',
            :decimalPrecision   =>'0',
            :showvalues         =>'0',
            :animation          =>'1',
            :numdivlines        =>'11',
            :numVdivlines       =>'0',
            :yaxisminvalue      =>'0',
            :yaxismaxvalue      =>'12',
            :lineThickness      =>'2',
            :rotateNames        =>'0') do

  xml.categories do
    for i in (1..holes)
      xml.category( :name => i.to_s)
    end
  end

  arr_colors = %w[009900 550000 0011FF BB9912]

  players.each_with_index do |player,i|
    if player.card
      cardStrokes = player.card.card_strokes
      xml.dataset(  :seriesname     => player.user.name,
                    :color          => arr_colors[i],
                    :showValue      => '1',
                    :alpha          => '100',
                    :anchorAlpha    => '0',
                    :lineThickness  => '2') do
        acumulate = 0
        for i in (1..holes)
          acumulate = acumulate + cardStrokes.find_by_hole_number(i)[0].strokes
          xml.set(  :value => acumulate)
        end
      end
    end
  end
end

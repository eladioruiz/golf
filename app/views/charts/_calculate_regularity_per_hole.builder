
xml = Builder::XmlMarkup.new
xml.graph(      :caption      => "Regularidad por Partidos" ,
                :subCaption   => subCaption ,
                :yAxisMaxValue=>"12" ,
                :yAxisMinValue=>"1" ,
                :xAxixName => "Fecha",
                :yAxixName => "Golpes",
                :rotateNames=>1 ,
                :showValues=>"0" ,
                :numberSuffix=>""  ,
                :bgColor=>"4B7297" ,
                :baseFontColor=>"FFFFFF" ,
                :canvasBgAlpha=>"0" ,
                :canvasBorderColor=>"FFFFFF" ,
                :divLineColor=>"FFFFFF" ,
                :divLineAlpha=>"100" ,
                :numVDivlines=>"10" ,
                :lineColor=>"BBDA00" ,
                :anchorRadius=>"4" ,
                :anchorBgColor=>"BBDA00" ,
                :anchorBorderColor=>"FFFFFF" ,
                :anchorBorderThickness=>"2" ,
                :showShadow=>"1" ,
                :decimalPrecision=>"0" ,
                :shadowColor=>'666666' ,
                :shadowAlpha=>'40' ,
                :lineThickness=>'4' ,
                :hoverCapBgColor=>"406181" ,
                :hoverCapBorderColor=>"406181"  ,
                :showAlternateVGridColor=>"1" ,
                :AlternateVGridColor=>'607F9D' ,
                :alternateVGridAlpha=>"75" ,
                :showAlternateHGridColor=>"1" ,
                :AlternateHGridColor=>'607F9D' ,
                :alternateHGridAlpha=>"75") do
	for item in regularity_data
    @date = Date.strptime(item[:date_hour_match],'%Y-%m-%d %H:%M:%S')
		xml.set(:name=>@date.strftime('%d/%m/%Y'),:value=>item[:strokes])
	end
end


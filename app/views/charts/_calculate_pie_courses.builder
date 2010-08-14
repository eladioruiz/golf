
xml = Builder::XmlMarkup.new
xml.graph(:caption=>'Campos Jugados', :subCaption=>'', :pieSliceDepth=>'30',:showNames=>'1', :decimalPrecision=>'0', :formatNumberScale=>'0', :numberSuffix=>' Veces') do
	for item in matches_data
		xml.set(:name=>item[:course_name],:value=>item[:played])
	end
end

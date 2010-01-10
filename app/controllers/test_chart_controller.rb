class TestChartController < ApplicationController
  def view
      @graph = open_flash_chart_object(600,300, '/testcharts/y_right')
  end

  def y_right
    title = Title.new("MY TITLE")
    bar = BarGlass.new
    bar.set_values([1,2,3,4,5,6,7,8,9])
    chart = OpenFlashChart.new
    chart.set_title(title)
    chart.add_element(bar)
    render :text => chart.to_s
  end
end

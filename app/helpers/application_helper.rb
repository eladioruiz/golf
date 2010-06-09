# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Construcción de gráficos estadísticos
  require "fusioncharts_helper"
  include FusionChartsHelper

  def flash_messages
    flash.map do |type, message|
      content_tag(:div, message, :class => type)
    end.join("\n")
  end

  def format_date(date)
    date.strftime('%d/%m/%Y - %H:%M')
  end


end

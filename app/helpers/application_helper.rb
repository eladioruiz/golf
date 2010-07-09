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

  def format_date_day(date)
    date.strftime('%d/%m/%Y')
  end

  def format_date_hour(date)
    date.strftime('%H:%M')
  end

  def format_nil(value,default)
    if value.nil? then
      default
    else
      value
    end
  end

  def course_image_default(course)
    if course.images.empty? then
      '/images/golf_03.gif'
    else
      course.images.first.fullName
    end
  end

  def format_handicap(handicap)
    if handicap.nil? then
      ' - '
    else
      handicap.to_s()
    end
  end
end

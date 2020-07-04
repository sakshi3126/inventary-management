module DisplayHelper

  def status_color(number)
    case
    when number < 10
      'danger'
    when (number >= 10 && number <= 1000)
      'info'
    else
      ''
    end
  end

  def format_badge(text, color)
    if text.to_i != nil
      content_tag :span, class: "badge badge-wrap text-uppercase badge-#{color}" do
        content_tag :strong, text.to_i
      end
    end
  end

  def status_badge(number)
    format_badge(number, status_color(number)) if number
  end


end
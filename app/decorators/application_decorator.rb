class ApplicationDecorator < Draper::Decorator
  def markdown(text)
  	Redcarpet.new(text, :hard_wrap, :filter_html, :autolink).to_html.html_safe
  end
end

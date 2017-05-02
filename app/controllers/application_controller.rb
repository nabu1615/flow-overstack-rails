class ApplicationController < ActionController::Base
  def setMarkDown
	@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, no_styles: true)
  end
end

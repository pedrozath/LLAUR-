module ApplicationHelper
	def glyph(glyph)
		"<i class='icon-#{glyph.to_s}'></i>".html_safe
	end
end
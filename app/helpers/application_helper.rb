module ApplicationHelper
	def glyph(glyph)
		"<i class='icon-#{glyph.to_s}'></i>".html_safe
	end

    def is_admin?
        true
    end
        
end
module ApplicationHelper
	def alternate_locales
	  I18n.available_locales.map{|l|
	    yield [I18n.t('language', locale: l), l]
	  }.join.html_safe
	end
end

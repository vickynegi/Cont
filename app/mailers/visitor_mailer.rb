class VisitorMailer < ApplicationMailer
	
	def welcome_email(visitor_id, args={})
		@visitor = Visitor.find_by(id: visitor_id)
		@args = args
		I18n.locale = args["locale"]
		mail(from: %("#{@visitor.first_name + " " +@visitor.last_name}" <#{"v111negi@gmail.com"}>),  to: "v_111negi@yahoo.com", subject: "#{I18n.t('email_subject')}")
	end
end

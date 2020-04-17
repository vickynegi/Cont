class VisitorObserver < ActiveRecord::Observer
  # after details got saved, email will be sent to receiver
  def after_save(record)
  	VisitorsWorker.perform_async(record.id, {email_contents: record.visitor_message, locale: record.locale})
  end
end
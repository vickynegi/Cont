class VisitorsWorker
  include Sidekiq::Worker

  def perform(visitor_id, args={})
  	VisitorMailer.welcome_email(visitor_id, args).deliver_now
  end
end
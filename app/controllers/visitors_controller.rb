class VisitorsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :find_visitor, only: [:submission]

  # this will save the details of the visitors and after details got saved, email will be sent to receiver
	# to send the email oberver file is created
  def submission
  	if @visitor
  		old_visitor
	  else
	  	new_visitor
	  end
  	redirect_to root_path(locale: params[:locale])
  end

  private

  def visitor_params
  	params.permit(:first_name, :last_name, :email, :phone, :message)
  end

  def find_visitor
  	@visitor = Visitor.find_by(email: visitor_params[:email])
  end

  # if visitor comes 1st time then details will be saved
  def new_visitor
  	@visitor = Visitor.new(visitor_params.except(:message))
  	@visitor.attributes= {locale: params.permit(:locale)[:locale], visitor_message: visitor_params[:message]}
  	@visitor.messages.build(description: visitor_params[:message])
  	if @visitor.save!
  		flash[:alert] = t ('success_msg')
  	else
  		flash[:alert] = t ('failure_msg')
  	end
  end
  
  # if visitor comes 2nd, 3rd and so on times then details will be updated and messages will be saved
  def old_visitor
  	@visitor.attributes= {locale: params.permit(:locale)[:locale], visitor_message: visitor_params[:message]}
    @visitor.messages.build(description: visitor_params[:message])
    if @visitor.update(visitor_params.except(:message))
			flash[:alert] = t ('success_msg')
		else
			flash[:alert] = t ('failure_msg')
		end
  end
end

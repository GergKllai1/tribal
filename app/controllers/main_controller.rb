class MainController < ApplicationController
  layout "application"

  def index
    if user_signed_in?
			user = current_user
			mysessions = user.sessions
    end
		sessions = Session.all
		channel_name = Session.find_by(id: params[:sessionId]).channel_name if params[:sessionId]
		sessions.each do | session |
			price = SessionPriceService.get_price(session)
			coach_name = ''
			session.users.coach.each do | coach |
				coach_name = coach.first_name
			end
			session.update_attribute(:price, price)
			session.update_attribute(:coach_name, coach_name)
		end
    @main_props = {sessions: sessions, user: user, mysessions: mysessions, channel_name: channel_name}
  end
end

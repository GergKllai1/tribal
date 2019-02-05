class SessionsController < ApplicationController
    layout "application"

	def show
		if user_signed_in?
			user = current_user
		end
		session = Session.find(params[:id])
		@session_props = {session: session, user: user}
    end
    
    def create
        pt = PriceTable.find_by(price_point: session_params[:price_point])
        @session = Session.new(session_params.except(:price_point).merge(price_table_id: pt.id))
        @session.save
        if @session.persisted?
            redirect_to root_path
        else
            render json: {errors: 'Every field needs to be filled in!'}
        end
    end

    private

    def session_params
        params.require(:session).permit(:title, :start_date, :price_point)
    end
end

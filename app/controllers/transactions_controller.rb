class TransactionsController < ApplicationController

	def new
		@session = Session.find_by_id(params[:sessionId])
	end

	def create
		session = Session.find(params[:session_id])
		customer = CreditCardService.create_stripe_customer(current_user,params)
		charge = CreditCardService.create_charge(customer,current_user,session)
		transaction = Transaction.create(
															amount: charge.amount/100,
															stripe_id: charge.id,
															payment_status: false,
															user_id: current_user.id,
															session_id: session.id)
		CreditCardService.delay(run_at: session.start_date).capture(transaction, session)
		if charge
			SessionStatusService.update_session(session)
			session.users << current_user
			redirect_to root_path, notice: "You just purchased a session!"
		else
			# session.users - [current_user]
			redirect_to session_path(session.id), notice: "Charge declined!"
		end
	end
end

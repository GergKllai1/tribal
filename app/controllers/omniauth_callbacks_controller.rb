class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
			@user = User.from_omniauth(request.env['omniauth.auth'], request.env['omniauth.params'])
			if @user.persisted?
					sign_in @user, event: :authentication
					unless request.env['omniauth.params']['session'] == ''
						redirect_to session_path(request.env['omniauth.params']['session'])
					else
						redirect_to root_path
					end
			else
					session['devise.facebook_date'] = request.env['omniauth.auth']
					redirect_to root_path
			end
	end

	def failure
    redirect_to root_path, notice: 'Could not authenticate you!'
	end

end



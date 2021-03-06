class Devise::RegistrationsController < DeviseController
    prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
    prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]
    prepend_before_action :set_minimum_password_length, only: [:new, :edit]

    def new
      build_resource
      yield resource if block_given?
      respond_with resource
    end

    def create
      build_resource(sign_up_params)
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          sign_up(resource_name, resource)
          redirect_to root_path
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        render json: {errors: resource.errors}
      end
    end

    def edit
      render :edit
    end

    def update
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

      resource_updated = update_resource(resource, account_update_params)
      yield resource if block_given?
      if resource_updated
        set_flash_message_for_update(resource, prev_unconfirmed_email)
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

        respond_with resource, location: after_update_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

    def destroy
      resource.destroy
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message! :notice, :destroyed
      yield resource if block_given?
      respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    end

    def cancel
      expire_data_after_sign_in!
      redirect_to new_registration_path(resource_name)
    end

    protected

    def update_needs_confirmation?(resource, previous)
      resource.respond_to?(:pending_reconfirmation?) &&
        resource.pending_reconfirmation? &&
        previous != resource.unconfirmed_email
    end

    def update_resource(resource, params)
      resource.update_with_password(params)
    end

    def build_resource(hash = {})
      self.resource = resource_class.new_with_session(hash, session)
    end

    def sign_up(resource_name, resource)
      sign_in(resource_name, resource)
    end

    def after_sign_up_path_for(resource)
      after_sign_in_path_for(resource) if is_navigational_format?
    end

    def after_inactive_sign_up_path_for(resource)
      scope = Devise::Mapping.find_scope!(resource)
      router_name = Devise.mappings[scope].router_name
      context = router_name ? send(router_name) : self
      context.respond_to?(:root_path) ? context.root_path : "/"
    end

    def after_update_path_for(resource)
      sign_in_after_change_password? ? signed_in_root_path(resource) : new_session_path(resource_name)
    end

    def authenticate_scope!
      send(:"authenticate_#{resource_name}!", force: true)
      self.resource = send(:"current_#{resource_name}")
    end

    def sign_up_params
        params.permit(:first_name,:last_name,:email,:password,:password_confirmation,:role)
    end

    def account_update_params
      devise_parameter_sanitizer.sanitize(:account_update)
    end

    def translation_scope
      'devise.registrations'
    end

    private

    def set_flash_message_for_update(resource, prev_unconfirmed_email)
      return unless is_flashing_format?

      flash_key = if update_needs_confirmation?(resource, prev_unconfirmed_email)
                    :update_needs_confirmation
                  elsif sign_in_after_change_password?
                    :updated
                  else
                    :updated_but_not_signed_in
                  end
      set_flash_message :notice, flash_key
    end

    def sign_in_after_change_password?
      return true if account_update_params[:password].blank?

      Devise.sign_in_after_change_password
    end
  end 
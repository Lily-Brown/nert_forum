class SessionsController < DeviseController

  def create
    build_resource
    resource = User.find_for_database_authentication(:login=>session_params[:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(session_params[:password])
      sign_in("user", resource)
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
      return
    end
    invalid_login_attempt
  end

  def session_params
    params.require(:data).require(:attributes).permit(:email,:password)
  end
end

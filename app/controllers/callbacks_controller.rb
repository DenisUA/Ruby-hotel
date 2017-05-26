class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in(@user, scope: :user)
    redirect_to @user
  end
end

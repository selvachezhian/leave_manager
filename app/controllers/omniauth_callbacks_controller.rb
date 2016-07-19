class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def slack
    redirect_to root_url
  end

end
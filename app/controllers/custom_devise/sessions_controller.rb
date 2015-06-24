class CustomDevise::SessionsController < Devise::SessionsController
  def create
    super
    Activity.create(action: Settings.action.login, user: current_user)
  end
end 
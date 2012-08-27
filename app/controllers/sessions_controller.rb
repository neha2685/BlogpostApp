class SessionsController < Devise::SessionsController
  # For security purposes, Devise just authenticates an user
  # from the params hash if we explicitly allow it to. That's
  # why we need to call the before filter below.
  before_filter :allow_params_authentication!, :only => :create

  def new
    @user = User.new(params[:user])
  end

end

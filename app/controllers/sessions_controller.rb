class SessionsController < ApplicationController

  def new
  end

  def create
    usert = Usert.find_by_email(params[:session][:email].downcase)
    if usert && usert.authenticate(params[:session][:password])
      sign_in usert
      redirect_to usert
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end

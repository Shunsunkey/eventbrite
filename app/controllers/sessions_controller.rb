# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Vous êtes connecté."
    else
      flash.now[:alert] = "Adresse e-mail ou mot de passe incorrect."
      redirect_to new_user_registration_path(email: params[:session][:email])
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Vous êtes déconnecté."
  end
end

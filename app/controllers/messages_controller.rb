class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.received_messages
  end

  def show
    @message = Message.find(params[:id])
    # Vérifier si l'utilisateur actuel est le destinataire du message
    if @message.recipient == current_user
      @message.mark_as_read! unless @message.read?
    else
      # Rediriger ou afficher un message d'erreur si l'utilisateur n'est pas autorisé à voir ce message
    end
  end

  def new
    @message = Message.new
    @recipient = User.find(params[:recipient_id])
  end # Ajout de l'end manquant

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    if @message.save
      redirect_to @message, notice: 'Message sent successfully.'
    else
      flash.now[:alert] = 'Invalid recipient'
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:recipient_id, :subject, :body)
  end

  def user_valid?(recipient_id)
    User.exists?(recipient_id)
  end
end

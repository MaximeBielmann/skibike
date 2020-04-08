class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Merci pour votre message, on vous recontacte rapdidement !'
    else
      flash.now[:error] = "Erreur pendant l'envoi du message."
      render :new
    end
    redirect_to :root
  end
end
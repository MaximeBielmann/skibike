class ChargesController < ApplicationController
  # display Stripe form to make a new payment
  def new
    @booking = Booking.find(params[:id])
    session[:booking_id] = @booking.id
    
    @price = 8000 * @booking.booking_participants
    session[:price] = @price
  end

  #  & check all data from Sripe
  def create
    # Amount in cents

    # get customer from POST params
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    begin
    @booking_id = session[:booking_id]
      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: session[:price],
        description: 'Rails Stripe customer',
        currency: 'cad'
      )
      session.delete(:price)
      @booking = Booking.update(@booking_id, payement_status: true)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
  end
end
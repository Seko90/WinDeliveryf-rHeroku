class OrderController < ApplicationController
  # Hier werden alle Kategorien abgerufen und
  # der ausgewähle Kunde mitgegeben
  def index
    @customer = Customer.find(params[:customer_id])
    @categories = Category.all
  end

  def show
    @orders = Order.all
  end

  def show_order
    @order = Order.find params[:id]
  end
  # Hier wird die Bestellung erstellt. Es werden die product-ids geholt
  # ,erstellen daraus eine liste mit ids und 
  # übergeben das dem gerade erstellten order-objekt,
  # welches dann gespeichert wird.
  def create
    @customer = Customer.find params[:order]["customer_id"]
    product_ids = params[:order]["product_ids"].split(",")
    @order = @customer.orders.build(product_ids: product_ids)

    if @order.save
      redirect_to show_customer_order_path(@order), notice: "Die Bestellung wurder erfolgreich gespeichert."
    else
      redirect_to order_index_path, customer_id: @customer.id, alert: "Die Bestellung konnte nicht gespeichert werden."
    end
  end
  
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params[:order].permit(:customer_id, :product_ids, :order_id)
  end
end

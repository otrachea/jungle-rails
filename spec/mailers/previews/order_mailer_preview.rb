# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_receipt_email
    order = Order.new(email: "test@example.com",
      total_cents: 3300,
      stripe_charge_id: 5)

    OrderMailer.with(order: order).order_receipt_email
  end
end

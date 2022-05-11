class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt_email
    @user = params[:user]
    @url = "/orders/#{params[:order_id]}"
    mail(to: @user.email, subject: "test subject line")
end

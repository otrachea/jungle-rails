class OrderMailer < ApplicationMailer
  def order_receipt_email
    @user = params[:user]
    @order = params[:order]
    @url = "/orders/#{@order[:id]}"
    puts "==" * 10
    puts @user.inspect
    puts @order.inspect
    puts "==" * 10

    
    mail(to: @user[:email], subject: "Jungle | Order ID: #{@order[:id]} | Thank you for your purchase!")
  end
end

class OrderMailer < ApplicationMailer
  default from: 'reception@ruby-hotel.com'

  def send_invoice(order, file)
    @user = order.user
    @order = order
    attachments['invoice.pdf'] = file
    mail(to: @user.email, subject: 'Thank you for your purchase')
  end
end

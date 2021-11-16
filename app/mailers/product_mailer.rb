class ProductMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.product_created.subject
  #
  def product_created
    @greeting = "You created a new product!"

    user = params[:user]
    @product = params[:product]
    # email_body = "
    # You created a new product!\n
    # The product named: #{product.title} has been added to your inventory.

    # "
    mail(
      to: user.email,
      subject: "You added a new product!"
    )
  end
end

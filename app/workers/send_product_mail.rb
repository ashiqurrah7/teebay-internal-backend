class SendProductMail
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform
        # ProductMailer.with(user: current_user, product: product).product_created.deliver_later
    end
end
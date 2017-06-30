class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    ActiveRecord::Base.transaction do
      return true if super && resource.id.present? && create_stripe_customer(resource)
      raise ActiveRecord::Rollback
    end
  end

private

  def create_stripe_customer(user)
    customer = Stripe::Customer.create(
      description: resource.full_name,
      email: resource.email
    )
    user.update(stripe_id: customer.id)
  end
end

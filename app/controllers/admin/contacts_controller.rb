class Admin::ContactsController < AdminController
  before_action :set_contact, only: %i[show edit destroy]

  def index
    @contact = Contact.new
    @contacts = Contact.all
  end

  def show; end

  def destroy; end

private

  def set_contact
    @contact = Contact.find(params[:id])
  end
end

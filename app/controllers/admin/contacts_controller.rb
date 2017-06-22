class Admin::ContactsController < AdminController
  before_action :set_contact, only: %i[show edit destroy]

  def index
    @contact = Contact.new
    @contacts = Contact.all
  end

  def show; end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: 'Message was successfully send.' }
        format.json { render :index, status: :created, location: @contact }
      else
        format.html { render :index }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_contacts_path, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
      end
  end
private

  def set_contact
    @contact = Contact.find(params[:id])
  end
end

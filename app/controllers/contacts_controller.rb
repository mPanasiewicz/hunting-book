class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = 'Successfully created new contact'
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def destroy
    Contact.destroy(params[:id])
    redirect_to contacts_path
    if Contact.where(id: params[:id])
      flash[:success] = 'You successfully removed contact'
    else
      flash[:warning] = 'Something goes wrong! Contact with administrator'
    end
  end

  def update
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address)
  end
end

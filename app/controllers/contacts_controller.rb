class ContactsController < ApplicationController
    def index
        render json: Contact.all
    end

    def create
        @contact = Contact.new(contact_params)

        if @contact.create(contact_params)
            render json: { message: "Contact has been created" }, status: :created
        else
            render json: { error: "Failure to create the contact" }, status: :unprocessable_entity
        end 
    end

    def update
        @contact = Contact.find_by(id: params[:id])
        if @contact.update(contact_params)
            render json: { message: "Contact has been updated" }, status: :ok
        else
            render json: { error: "Failure to update the contact" }, status: :unprocessable_entity
        end
    end

    def destroy
        @contact = Contact.find_by(id: params[:id])
      
        if @contact
          @contact.destroy
          render json: { message: "Contact has been deleted" }, status: :ok
        else
          render json: { error: "Contact not found" }, status: :not_found
        end
    end

    private

    def set_contact
        @contact = Contact.find(params[:id])
    end

    def contact_params
        params.require(:contact).permit(:name, :phone)
    end
end

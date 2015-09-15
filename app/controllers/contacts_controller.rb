class ContactsController < ApplicationController
    def index
        redirect_to action: :new
    end

    def new
        # @estado = request.location.data["region_name"]
    end

    def create
        @contact = Contact.create params[:contact]
        UserMailer.contact_mail(params[:contact]).deliver
    end
end
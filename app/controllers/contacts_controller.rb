class ContactsController < ApplicationController
    def new
    #   　@contact = Contact.new
    end
    
    def confirm
        @contact = Contact.new(contact_params)
        if @contact.invalid?
          render new_contact_path
        end
    end
    
    def back
        @contact = Contact.new(contact_params)
        render new_contact_path
    end
    
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
          ContactMailer.send_mail(@contact).deliver
          # flash[:email] =　"送信しました"
          redirect_to done_path
        else
          render new_contact_path
        end
    end
    
    def done
        
    end

  private

  def contact_params
    params.permit(:name, :email, :subject, :message)
  end
  
end

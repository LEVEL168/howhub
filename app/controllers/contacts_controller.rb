class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
          ContactMailer.send_mail(@contact).deliver
          redirect_to done_path
        else
          flash.now[:warning] = "*の項目を正しく入力してください"
          render new_contact_path
        end
    end
    
    def done
        
    end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
  
end

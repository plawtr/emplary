class UsersController < ApplicationController
  
  def new
  end

  def create
    mailchimp_register(params[:email], params[:zipcode])   
  end

  def mailchimp_register(email, zipcode)
  	gb = Gibbon::API.new
    begin

    	gb.lists.subscribe({:id => ENV['MAILCHIMP_LIST_ID'], 
          :email => {:email => email}, 
          :merge_vars => {:ZIPCODE => zipcode},
          :double_optin => false,
        	:send_welcome => true})

		rescue Gibbon::MailChimpError => e
      error = e.code == 214 ? "#{email} is already subscribed" : e.message
  		flash[:error] = error
      redirect_to new_user_path
    else
      flash[:notice] = "Succesfully registered"
      redirect_to thank_you_path
		end
      
  end

end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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


  # GET /users/:id
  def show
    # authorize! :read, @user
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id
  def update
    # authorize! :update, @user
    if @user.update(user_params)
      sign_in(@user == current_user ? @user : current_user, :bypass => true)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render action: 'edit' 
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id
  def destroy
    # authorize! :delete, @user
    @user.destroy
    redirect_to root_url
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [:name, :email] # extend with your own params
    accessible << [:password, :password_confirmation] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end

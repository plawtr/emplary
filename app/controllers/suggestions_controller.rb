class SuggestionsController < ApplicationController
  
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
    if mail_admins.include? "Queued. Thank you."
      redirect_to root_url, alert: "Suggestion accepted." 
    else 
      redirect_to root_url, alert: "Suggestion not accepted." 
    end
  end

  private

  def mail_admins
    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}@api.mailgun.net/v2/#{ENV['MAILGUN_DOMAIN']}"+"/messages",
      :to => ENV['MAILGUN_RECEPIENT'], 
      :subject => "New Suggestion",
      :text => "User with id #{params[:id]} has posted: #{params[:url]}, #{params[:description]}",
      :from => "postmaster@emplary.com"
  end
end
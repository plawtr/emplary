class ResultsController < ApplicationController
  
  geocode_ip_address

  def index
  end

  def create
    @user_location = location_factory_for(params[:postcode])
    if @user_location  
      @result = ResultsPresenter.new @user_location 
      render action: 'index'
      @result = nil
    else
      redirect_to root_url, alert: "Invalid US/UK zipcode."
    end

  end

  private

  def location_factory_for(postcode)
    location = valid?(postcode) ? Geokit::Geocoders::MultiGeocoder.geocode(valid?(postcode)) : session[:geo_location]    
    flash[:notice] = "Invalid US/UK zipcode, using location from your IP address." if location == session[:geo_location] 
    return location if (not location.nil?) && location.success && in_UK_or_US?(location) 
    return nil
  end

  def valid? postcode
    GoingPostal.postcode?(postcode, "US") || GoingPostal.postcode?(postcode, "GB") 
  end

  def in_UK_or_US? location
    %w(UK US GB).each {|country| return true if location.inspect.include? country}
    return false
  end

end
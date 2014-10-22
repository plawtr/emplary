class ResultsController < ApplicationController
  
  geocode_ip_address

  def index

  end

  def create
    @full_address = address_factory_for(params[:postcode], session[:geo_location])
    if @full_address 
      render action: 'index'
    else
      redirect_to root_url, alert: "Invalid zipcode."
    end
  end


  private
  
  def address_factory_for(postcode, geolocation)
    location = valid?(postcode) || session[:geo_location] || cookies[:geo_session]

    if location.nil? 
      return nil
    else 
      address = Geokit::Geocoders::MultiGeocoder.geocode(location).full_address
      return address if located_in_UK_or_US? address 
    end

    return nil
  end

  def location_from session
    session[:geo_location].inspect
    cookies[:geo_session].inspect
  end

  def valid? postcode
    GoingPostal.postcode?(postcode, "US") || GoingPostal.postcode?(postcode, "GB") 
  end

  def located_in_UK_or_US? address
    address.include?("UK") || address.include?("US")
  end

end
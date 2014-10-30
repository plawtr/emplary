class ResultsPresenter

  def initialize(user_location)
    @user_location = user_location
  end

  def bounds
    Geokit::Bounds.from_point_and_radius(@user_location, 50)
  end 

  def locations 
    Location.in_bounds(bounds)
  end 

  def sources 
    Source.with_providers_within(bounds)
  end

  def source_names
    sources.pluck(:name)
  end

  def url_encode_for(string)
    string.parameterize.underscore 
  end

  def full_address
    @user_location.full_address || "#{@user_location.city.to_s} #{@user_location.state_code}, #{@user_location.country}" 
  end
end
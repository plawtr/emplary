class ResultsPresenter

  def initialize(user_location)
    @user_location = user_location
  end

  def sources 
    Source.all.includes(:providers, :categories, :items)
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
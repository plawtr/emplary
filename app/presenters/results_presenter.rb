class ResultsPresenter

  def initialize(results = nil)
    @result = result
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

  def method_missing(method)
    @result.send(method) rescue nil
  end
end
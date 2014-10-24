class ResultsPresenter

  include Rails.application.routes.url_helpers
  DEFAULT_FORMAT = 'small'

  FORMAT_TYPES = [:small, :large]

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

  FORMAT_TYPES.each do |format|
    define_method "#{format}_image_url" do
      @result.multimedia[:images][format][:url]
    end

    define_method "#{format}_video_url" do
      @result.multimedia[:videos][format][:url]
    end
  end

  def url(type = :image)
    @result.multimedia[type][DEFAULT_FORMAT][:url]
  end

  def caption
    @result.caption || "No caption"
  end

  # ... Other presenter methods

  def method_missing(method)
    @result.send(method) rescue nil
  end
end
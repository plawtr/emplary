module DeviseHelper
  # A simple way to show error messages for the current devise resource. If you need
  # to customize this method, you can either overwrite it in your application helpers or
  # copy the views to your application.
  #
  # This method is intended to stay simple and it is unlikely that we are going to change
  # it to add more behavior or options.
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML

    <div class="large-3 small-centered columns" id="flash-container" style="margin-top: 20px">
      <div id="error_explanation">
        <div data-alert class="alert-box info radius">
            #{sentence}
            <br>
            #{messages}
          <a href="#" class="close">&times;</a>
        </div>
      </div>
    </div>
    HTML

    html.html_safe
  end
end
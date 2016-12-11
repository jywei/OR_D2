class CustomResponder < ActionController::Responder
  def to_html
    unless has_errors?
      if post? #create
        controller.flash.notice = resource.class.name.humanize +  " created successfully"
      elsif patch? || post?
        controller.flash.notice = resource.class.name.humanize +  " updated successfully"
      end
    end

    super
  end
end

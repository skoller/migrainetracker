# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def logo
    image_tag("logo_hl_1.png", :alt => "Headache-LINE", :class => "round")
end

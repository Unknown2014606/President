module ApplicationHelper
  def button_to(image_path, link)
    link_to image_tag(image_path, size: "100x60"), link
  end
end

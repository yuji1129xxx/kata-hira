module ApplicationHelper
  def person_photo(person)
    if person.avatar.present?
      person.avatar.url(:medium)
    elsif person.pfile.present?
      "people/#{person.pfile}.png"
    else
      "no_image1.png"
    end
  end

  def resource_photo(resource)
    if resource.avatar.present?
      resource.avatar.url(:medium)
    elsif resource.pfile.present?
      "resources/#{resource.pfile}.png"
    else
      "no_image2.png"
    end
  end

  def br(str)
    h(str).gsub(/(\r\n?)|(\n)/, "<br />").html_safe
  end
end

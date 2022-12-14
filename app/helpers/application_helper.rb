module ApplicationHelper
  BASE_TITLE = "Wind Instrument Reviews Please".freeze

  def page_title(page_title)
    page_title.blank? ? BASE_TITLE : "#{page_title} - #{BASE_TITLE}"
  end
end

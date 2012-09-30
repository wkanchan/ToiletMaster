# duplicate with one in application_helper.rb

def full_title(page_title)
  def full_title(page_title)
    base_title = "ToiletMaster"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
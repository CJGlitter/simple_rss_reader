module ApplicationHelper
  def trim_desc(str)
    split = str.split("<p>")
    return split[0]
  end
end

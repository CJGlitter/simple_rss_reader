module ApplicationHelper
  def trim_desc(str)
    split = str.split("<p>")
    return split[0]
  end

  def returns_fix(str)
    str.gsub "\n", "\r"
  end

  def cleanup(str)
    new_str = trim_desc(str)
    new_str = returns_fix(new_str)
    return new_str
  end
end

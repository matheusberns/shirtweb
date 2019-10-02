module ApplicationHelper

  def replace_dot(string)
    string.to_s.sub(".", ",")
  end

end

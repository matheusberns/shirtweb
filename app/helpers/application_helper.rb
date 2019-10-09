# frozen_string_literal: true

module ApplicationHelper
  def replace_dot(string)
    string.to_s.sub('.', ',')
  end

  def get_user(user)
    user = user.split('@')[0]
    @current_user_super = user
  end
end

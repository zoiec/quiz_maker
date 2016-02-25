module ApplicationHelper
  def log_in_button
    if current_page?(controller: 'devise/sessions', action: :new)
      ''
    elsif current_user.nil?
      link_to "Log In", new_user_session_path
    else
      current_user.email
    end
  end
end

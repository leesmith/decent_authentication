module ApplicationHelper
  def filtered_user_messages(user)
    user.errors.full_messages.delete_if { |msg| msg =~ /Password digest/ }
  end
end

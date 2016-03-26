module ApplicationHelper
  
  def current_user_image(size = nil)
    if current_user.image? && size.nil?
      # note: google has a default img thumbnail so our bootstrap thumbnail is a third backup
      raw("<img class=\"img responsive\" src=\"#{current_user.image}\" height=\"25\" width=\"25\" %>")
    elsif (size == 'big') && current_user.image?
      raw("<img class=\"img responsive\" src=\"#{current_user.image}\" height=\"150\" width=\"150\" %>")
    else
      raw("<span class=\"glyphicon glyphicon-user\" aria-hidden=\"true\">")
    end
  end
  
end

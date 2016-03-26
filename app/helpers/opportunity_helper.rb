module OpportunityHelper
  
  def address_renderer(street, city, state, zip)
    address_string = ''
    (address_string << street + ",\n") if street.present?
    (address_string << city   + ",\n") if city.present?
    (address_string << state  + "\n") if state.present?
    (address_string << zip    + "\n") if zip.present?
    return address_string
  end

  def amount_renderer(amount, inspector_email, appraiser_email)
    if (current_user.email == inspector_email) && (current_user.email != appraiser_email)
      return "N/A"
    else
      return number_to_currency(amount)
    end
  end

  def boolean_renderer(boolean_attribute)
    if (boolean_attribute.present?) && (boolean_attribute == true)
      return content_tag(:span, nil, :class => "glyphicon glyphicon-ok green", :'aria-hidden' => "true")
    else
      return content_tag(:span, nil, :class => 'glyphicon glyphicon-remove red', :'aria-hidden' => 'true')
    end
  end

end